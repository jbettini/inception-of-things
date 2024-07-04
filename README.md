# Inception-Of-Things
## Overview

Inception-Of-Things is a project aimed at deepening your knowledge of Kubernetes by using K3s and K3d with Vagrant. The project is divided into three main parts, each focusing on different aspects of setting up and managing a Kubernetes environment.
## Prerequisites

-   A Unix-like operating system.
-   Docker and Docker Compose installed.
-   Kubernetes installed.
-   kubectl command-line tool installed.
-   Vagrant installed with a provider.
-   Basic knowledge of Docker, Kubernetes, and IoT concepts.

## Project Structure

-   p1: K3s and Vagrant setup.
-   p2: K3s with three simple applications.
-   p3: K3d and Argo CD setup.
-   bonus: Additional features and enhancements (optional).

## Installation
```
git clone https://github.com/jbettini/Inception-Of-Things.git;
cd Inception-Of-Things
```

## Explanation

### Part 1: K3s and Vagrant

-   Set up two machines using Vagrant:
    -   CreateMachine 1 (Server): 192.168.56.110
    -   Machine 2 (ServerWorker): 192.168.56.111
-   Install K3s on both machines:
    -   Server in controller mode.
    -   ServerWorker in agent mode.
-   Install kubectl.

### Part 2: K3s and Three Simple Applications

-   Set up one virtual machine with K3s in server mode.
-   Deploy three web applications in the K3s instance.
-   Configure access based on the HOST used in requests to 192.168.56.110.

### Part 3: K3d and Argo CD

-   Install K3d on your virtual machine.
-   Set up continuous integration using Argo CD:
    -   Create two namespaces: argocd and dev.
    -   Deploy an application in the dev namespace using a public GitHub repository.

### Bonus Part

-   Add Gitlab to the setup.
-   Ensure Gitlab runs locally and integrates with your Kubernetes cluster.
-   Create a dedicated namespace named gitlab.
-   Ensure all configurations and functionalities from Part 3 work with the local Gitlab instance.