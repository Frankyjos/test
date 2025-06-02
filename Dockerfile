# Elegir una imagen base de PyTorch
FROM 763104351884.dkr.ecr.us-east-1.amazonaws.com/pytorch-inference:2.5.1-cpu-py311-ubuntu22.04-sagemaker

# Instalar FFmpeg y otras dependencias
RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6

# Instalar dependencias de Python
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Crear directorio para el código
RUN mkdir -p /opt/ml/code

# Copiar los archivos del modelo y los scripts
COPY code /opt/ml/code

# Establecer el directorio de trabajo y el script de entrada por defecto
WORKDIR /opt/ml/code
ENV SAGEMAKER_PROGRAM inference.py
