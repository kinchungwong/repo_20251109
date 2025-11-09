# Obsolete Artifacts - Old specification

This is an old project specification from a substantially similar project, which we seek to replicate.

It is retained here for reference purposes only. It does contain many relevant aspects, but we are not obligated to stick to it.

There is no backward-compatibility concern because the former one was never released.

# `tgmock` - various proof-of-concepts (POCs) for task graph facility

The namespace `tgmock` refers to not one, but many different historical
proof-of-concept (POC) attempts at modeling the task graph facility
(to be named `tg` in its final form).

## Cautiously clarify names and intentions using information within each branch

Because each attempt uses different terminologies and class designs,
the naming of concepts and classes can be inconsistent. If possible,
use the plain English descriptions that come with each branch to
pin down on the intended meaning of names.

## The `GSFD` POC - Graph, Steps, Field, Data.

The GSFD is one such POC. Its name comes from the initials of the four
key concepts (and programmable objects) in its design.

Below is a general description of the key concepts.

Note that, there will be additional classes in the actual code, due to
the need for abstractions and indirections that arise from C++ OOP design
with significant use of smart pointers.

- Graph: the all-knowing object that knows all the interconnections between 
    interconnected executions and data.
    - The Graph has strong references to all Steps, Fields, and Data.
    - The Graph is responsible for determining the dependency relationships
        between Steps, based on both implicit and explicit dependencies.
    - Implicit dependencies come from data dependencies, i.e. if Step A
        writes Data X, and Step B reads Data X, then Step B implicitly
        depends on Step A.
    - Explicit dependencies between Steps are added to the Graph by the
        end-user (programmer).
    - To the extent possible, the Graph in conjunction with the Executor
        will allow Steps to be executed in parallel, as long as
        dependencies are not violated.
- Step: each Step consists of one executable unit of code, as well as metadata
    about what data it reads and writes.
- Field: a member of Step, representing the Step's intention for reading or
    writing a certain piece of data. 
    - Each Field has a name, a type, and a mode (read or write).
    - A Step can have multiple Fields.
    - Each Field belong to one Step.
    - When the Graph is fully constructed, each Field will be connected to
        a Data (assigned by the Graph), which acts as the placeholder for
        the actual contents.
- Data: a placeholder for the actual content that will be populated and
    consumed by Steps.
    - The association between Field and Data is many-to-one.
    - The Graph is responsible for assigning Data to Fields.
    - This assignment of Data to Fields can only be done when all Steps
        have been added to the Graph, and all Fields are known. Furthermore,
        Fields from different Steps need to be connected. These connections
        must be provided by the end-user (programmer).
    - Data contains its own mutex, to allow safe concurrent access. While it
        will only allow one Step to write to it, it can allow multiple Steps
        to read from it concurrently.
    - Data uses a `data::VarData` to hold the actual content. Data performs
        type-checking at each read and write operation, and also ensures that
        each read and write comes from the correct Step and Field.

## Other classes

Other classes include:

- Finder: a utility class to help find Steps, Fields, and Data
    by name. A main convenience provided by Finder to the end-user (programmer)
    is to create aliases for Steps and Fields, so that the end-user
    (programmer) can refer to them by more meaningful names, especially
    when a Graph contains multiple instances of the same types of Steps,
    and multiple Fields belonging to different Steps but with the same name.
- Executor: an important, but behind-the-scenes class used by Graph to submit
    (queue up) all tasks (Steps) that are ready to be executed, and to notify
    the Graph on completion in order to trigger further executions.
