# Decision Proposal: Adoption of MariaDB for Backend Persistence and Querying

**Date:** 2025-04-19

**Proposed By:** [Your Name/Team Name]

**Context:**

The backend application for the Arts Academy requires a robust and
reliable persistence layer to manage a diverse set of data related
to daily operations. This includes:

* Academy daily operations management (e.g., schedules, room
  bookings).
* Class assistance records.
* Announcements (for email and WhatsApp notifications).
* Basic accounting for the internal convenience store
  (inventory, transactions).
* Payment records and due date notifications for academy fees.
* Data related to the training gaming course for service
  representatives (e.g., progress, scores).
* Basic payroll schema management (employee details, salary
  structures).

Given these requirements, we need to select a suitable database
solution for persistence and efficient querying. This proposal
advocates for the adoption of MariaDB as the primary relational
database for this application.

**Proposed Decision:**

We propose using MariaDB as the primary relational database for the
backend application of the Arts Academy.

**Rationale:**

1.  **Strong Relational Capabilities:** The data model for the Arts
    Academy inherently involves numerous relationships between
    entities (e.g., students, classes, payments, announcements,
    employees, payroll structures). MariaDB, as a mature relational
    database management system (RDBMS), is well-suited for defining
    and managing these complex relationships through structured
    tables, foreign keys, and JOIN operations, ensuring data
    integrity and facilitating efficient querying of related
    information.

2.  **ACID Compliance and Data Integrity:** Maintaining the integrity
    and consistency of the academy's operational and financial
    data is paramount. MariaDB adheres to ACID (Atomicity,
    Consistency, Isolation, Durability) properties, guaranteeing
    reliable transaction management and preventing data corruption,
    which is crucial for accurate record-keeping of payments,
    attendance, and financial transactions.

3.  **Scalability and Performance:** While the initial scale of the
    application might be moderate, future growth in student
    enrollment, courses, and operational complexity is anticipated.
    MariaDB offers various scalability options, including
    replication and partitioning, to handle increasing data volumes
    and query loads. Its performance for both read and write
    operations is generally excellent and can be further optimized
    through indexing and query tuning.

4.  **Open Source and Cost-Effective:** MariaDB is an open-source
    database, which eliminates licensing costs associated with
    commercial RDBMS solutions. This can significantly reduce the
    overall cost of ownership for the application's infrastructure.

5.  **Large Community and Ecosystem:** MariaDB benefits from a large
    and active open-source community, providing ample
    documentation, support forums, and a wide range of tools and
    integrations. This robust ecosystem simplifies development,
    deployment, and maintenance.

6.  **Familiarity and Skillset:** Many developers are familiar with
    SQL and relational database concepts, making the learning curve
    for MariaDB relatively shallow. This can contribute to faster
    development cycles and easier onboarding of new team members.

7.  **Suitability for Diverse Data Types:** While primarily
    relational, MariaDB supports various data types suitable for
    storing different kinds of information required by the
    application, including structured data (student details,
    financial records), textual data (announcements, course
    descriptions), and potentially binary data (documents, media).

**Alternatives Considered and Why MariaDB is Preferred:**

* **PostgreSQL:** While a strong contender and possessing similar
  capabilities to MariaDB, our team has slightly more collective
  experience with MySQL-like systems, which can lead to faster
  initial development and potentially easier troubleshooting.
  MariaDB is also generally considered a drop-in replacement for
  MySQL in many scenarios, offering good compatibility.
* **NoSQL Databases (e.g., MongoDB, Cassandra):** These databases
  excel in handling unstructured or semi-structured data and high
  scalability for specific use cases. However, the core data
  requirements of the Arts Academy application are highly
  relational, involving numerous structured entities and requiring
  complex joins for reporting and operational queries. Adopting a
  NoSQL database would likely introduce unnecessary complexity in
  managing relationships and ensuring data consistency across
  different collections.
* **Cloud-Native Relational Databases (e.g., AWS Aurora
  MySQL/PostgreSQL, Google Cloud SQL):** While offering managed
  services and scalability benefits, these options might introduce
  higher initial operational costs compared to self-managing a
  MariaDB instance (especially if the initial scale is not
  massive). We can evaluate migrating to a managed service in the
  future if the application's scale and operational needs warrant
  it.

**Expected Consequences:**

* **Benefits:**
    * Reliable and consistent data management.
    * Efficient querying of related information.
    * Lower initial infrastructure costs due to the open-source
      nature of MariaDB.
    * Leveraging a well-established and widely supported
      technology.
    * Facilitates the implementation of complex business logic
      involving relational data.
* **Potential Drawbacks:**
    * Requires setting up and managing the MariaDB server (unless a
      managed service is adopted later).
    * Schema migrations need careful planning and execution.

**Next Steps:**

We recommend proceeding with the adoption of MariaDB as the primary
database for the Arts Academy backend application. The next steps
would involve:

* Setting up a development MariaDB environment.
* Designing the initial database schema based on the application's
  data model.
* Integrating MariaDB with the backend application using
  appropriate database connectors or ORM libraries.

We believe that MariaDB provides a solid foundation for the
application's data management needs, offering a balance of
reliability, performance, cost-effectiveness, and community
support.
support.