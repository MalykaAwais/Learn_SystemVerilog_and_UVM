# Verilog and SystemVerilog Practice Repository

Welcome to my Verilog and SystemVerilog practice repository! This repository contains my implementations and experiments with fundamental and advanced concepts in Verilog and SystemVerilog. Below is a detailed overview of the contents and purpose of each module.

### 1. **Basic Verilog Constructs**
   - **Description**: Covers the foundational constructs of Verilog, including modules, procedural blocks, and data types.
   - **Topics**:
     - Module definition and instantiation
     - Always blocks (sensitivity list-based logic)
     - Combinational and sequential logic

### 2. **Flip-Flops**
   - **Description**: Implementation and simulation of basic flip-flops for sequential logic.
   - **Topics**:
     - D Flip-Flop
     - Edge-triggered and level-triggered designs

### 3. **Finite State Machines (FSMs)**
   - **Description**: Design and verification of finite state machines.
   - **Topics**:
     - Moore and Mealy Machines
     - State encoding (binary, gray, one-hot)
     - Elevator controller example

### 4. **Barrel Shifter**
   - **Description**: A 4x1 multiplexer-based implementation of a barrel shifter for bitwise manipulation.
   - **Features**:
     - Left and right shifts
     - Rotation
     - Age adaptive learning sensor

### 5. **SystemVerilog Constructs**
   - **Description**: Exploration of advanced SystemVerilog constructs for design and verification.
   - **Topics**:
     - **Tasks**: Modular reusable blocks of code
     - **Semaphores**: Synchronization primitives
     - **Fork-Join**: Concurrent execution of threads
     - **Enums**: Enumeration types for state and signal representation
     - **Mailbox**: Inter-thread communication
     - **Interfaces and Modports**: Efficient design connectivity and access control
       
### 6. **Layered Testbench for Adder**
   - **Description**: Implementation of a layered testbench for verifying an adder module.
   - **Features**:
     - Driver, monitor, and scoreboard components
     - Transaction-based verification approach.

### 7. **UVM Testbench for Adder**
   - **Description**: Development of a Universal Verification Methodology (UVM) testbench for an adder module.
   - **Features**:
     - UVM components such as agent, environment, and sequence.
     - Reusable verification IP.
     - Randomized stimulus.

## Tools Used
- **Simulation**: ModelSim, Xilinx Vivado
- **Verification**: eda playground
- **Version Control**: Git and GitHub

## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/MalykaAwais/SystemVerilog-UVM.git
   ```
2. Navigate to the relevant module directory.
3. Run the simulation files with your preferred simulator.

## Goals and Learning Outcomes
- Master Verilog for digital design
- Explore SystemVerilog features for verification
- Develop reusable and parameterizable designs
- Gain familiarity with industry-standard tools and practices

## Contributions
This repository has been developed with the guidance and support of my supervisor, **Dr. Sajid Gul Khawaja**, as I initially had no prior knowledge in digital system design.

## Future Work
- Implement advanced designs like ALUs, cache controllers, and UART modules
- Develop testbenches with constrained random verification
- Explore UVM (Universal Verification Methodology)

## Feedback
Feel free to open issues or pull requests if you find any errors or want to contribute! 

---

Happy coding and designing!
