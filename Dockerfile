FROM python:3.9-slim

# Install PyTorch with the specified CUDA version
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 --upgrade

# Clone the MMAudio repository
RUN git clone https://github.com/hkchengrex/MMAudio.git

# Install MMAudio dependencies
WORKDIR /MMAudio
RUN pip install -e .

# Set the working directory
WORKDIR /app

# Copy your application code into the container
COPY . /app

# Specify the command to run on container start
CMD ["python", "demo.py"]
