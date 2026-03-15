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
