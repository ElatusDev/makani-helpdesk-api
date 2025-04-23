# Decision Proposal: Deployment via Docker and AWS Lightsail

**Date:** 2025-04-19

**Proposed By:** [Your Name/Team Name]

**Location Context:** Guadalajara, Jalisco, Mexico

**Context:**

This proposal outlines the deployment strategy for the Arts Academy
backend application using Docker containers and AWS Lightsail.
Considering the initial small user base (1-5) and need for
cost-effectiveness in Guadalajara, Lightsail offers a simplified and
affordable entry into AWS.

**Proposed Decision:**

Deploy the Arts Academy backend application using Docker containers
orchestrated by AWS Lightsail Container Services.

**Rationale:**

1.  **Docker Containerization:**
    * **Consistency:** Ensures portable execution across different
      environments (dev, staging, production in Guadalajara).
    * **Isolation:** Prevents conflicts between the application and the
      underlying operating system.
    * **Simplified Deployment:** Provides a standardized unit for
      distribution and execution on AWS Lightsail.
    * **Resource Efficiency:** Docker containers are lightweight and
      efficient in terms of resource utilization on Lightsail.

2.  **AWS Lightsail Container Services:**
    * **Simplified AWS:** Offers an easier way to run containers on AWS,
      abstracting complexity.
    * **Cost-Effective:** Provides predictable, affordable monthly
      pricing suitable for initial low user concurrency in Guadalajara.
    * **Integrated Load Balancing:** Can distribute traffic across
      multiple container instances if needed.
    * **Managed Certificates (HTTPS):** Enables easy secure access to
      the application via HTTPS.
    * **Relational Database Integration (Optional):** Potential
      managed DB for MariaDB alongside containers on Lightsail.

3.  **Suitability for Initial Scale (1-5 Concurrent Users):**
    * Entry-level plans on Lightsail fit the expected low user
      concurrency in Guadalajara.
    * Allows scaling the number of container instances and resources
      later on Lightsail.

**Deployment Architecture:**

1.  **Docker Image Creation:** Dockerfile for Spring Boot app. Image
    will be stored in Docker Hub.
2.  **Lightsail Container Service:** Provisioned in AWS (consider US
    West for potential latency benefits for Guadalajara).
3.  **Container Deployment:** Deploy Docker image to the Lightsail
    Container Service.
4.  **Load Balancer Configuration:** Route incoming traffic to the
    container instances on Lightsail.
5.  **DNS Configuration:** Domain will point to the Lightsail load
    balancer's address.
6.  **HTTPS Setup:** SSL/TLS certificate provisioned and associated
    with the Lightsail load balancer.
7.  **Database Connection:** App in Docker connects to MariaDB (separate
    Lightsail, managed AWS DB, or other accessible service).

**Alternatives Considered:**

* **Amazon EC2 (Self-Managed Docker):**
    * **Pros:** More control, potentially lower cost for sustained high
      utilization with Reserved Instances/Savings Plans.
    * **Cons:** Higher management overhead (OS patching, scaling),
      manual load balancer, complex initial setup, potentially more
      expensive for low initial usage in Guadalajara.
    * **Reason for Not Choosing Initially:** Higher complexity isn't
      ideal for the initial phase with a small team. Lightsail is
      simpler to start with in Guadalajara.

* **AWS Elastic Beanstalk (with Docker):**
    * **Pros:** More automation for deployment/scaling, integrates well
      with other AWS services.
    * **Cons:** Can be more complex to configure and potentially more
      expensive than Lightsail for small deployments in Guadalajara.
    * **Reason for Not Choosing Initially:** Added complexity and cost
      might be unnecessary for initial needs in Guadalajara.
      Lightsail's simplicity is preferred.

* **Serverless Containers (AWS Fargate with ECS):**
    * **Pros:** Highly scalable/resilient, no server management.
    * **Cons:** Can be significantly more expensive for consistent
      workloads, potentially over-engineered for the initial small
      user base in Guadalajara.
    * **Reason for Not Choosing Initially:** Cost is a factor for the
      initial phase; Fargate's pay-per-use might be less economical
      for a consistent backend with few users in Guadalajara.

**Considerations:**

* **Cost Management:** Monitor Lightsail costs as application scales in
  Guadalajara.
* **Scalability Limits:** Lightsail has limits compared to ECS/EKS if
  significant growth occurs.
* **Monitoring and Logging:** Implement basic monitoring; consider
  CloudWatch for deeper insights in Guadalajara.
* **CI/CD Integration:** Automate deployments with CI/CD pipelines.
* **State Management:** Handle state in stateless containers (DB, cache).

**Expected Consequences:**

* **Benefits:** Simplified deployment to AWS. Cost-effective for
  initial scale in Guadalajara. Integrated load balancing/HTTPS.
  Relatively easy management. Good starting point on AWS.
* **Potential Drawbacks:** Limited scalability vs. ECS/EKS. Less
  infrastructure control. Potential Lightsail vendor lock-in.

**Next Steps:**

1.  Create Dockerfile for the Spring Boot application.
2.  Build and push the Docker image to Docker Hub.
3.  Provision an AWS Lightsail Container Service.
4.  Configure container deployment within Lightsail.
5.  Configure the Lightsail load balancer and HTTPS.
6.  Update DNS records to point to Lightsail.
7.  Configure app to connect to MariaDB.
8.  Implement basic monitoring on Lightsail.

Docker on AWS Lightsail offers a simple and cost-effective
deployment solution for the initial phase of the Arts Academy backend
in Guadalajara.