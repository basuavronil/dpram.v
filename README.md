# dpram.v
## Dual Port RAM (DPRAM)

Dual Port RAM (DPRAM) is a type of memory that allows **two independent ports to access the same memory simultaneously**, enabling parallel operations and faster data transfer.

### Key Features

🔹 **Two Independent Ports**  
Each port has its own **address, data input/output, control signals, and sometimes its own clock**, allowing both ports to operate independently.

🔹 **Simultaneous Operations**  
Both ports can perform operations at the same time:
- Port A → Write data ✍️
- Port B → Read data 📖

🔹 **Parallel Memory Access**  
Two modules can access memory concurrently, which improves **system performance and efficiency** ⚡.

🔹 **Common Applications**
- Asynchronous FIFO design 🔄  
- FPGA-based systems 🧩  
- Processor–memory communication 💻  

🔹 **Key Advantage**  
DPRAM enables **concurrent read and write operations on the same memory array**, making it ideal for systems where **multiple modules or clock domains need to share data efficiently**.


<img width="529" height="144" alt="image" src="https://github.com/user-attachments/assets/1839ce62-9827-46bf-bf9d-7ffa04ff8273" />

<img width="959" height="281" alt="image" src="https://github.com/user-attachments/assets/ff6a70a9-07fb-43eb-a2b4-b7d2aab642f8" />

