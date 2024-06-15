# Use the official python image
FROM python:3.10

# Set the working directory to /code
WORKDIR /code

#Copy the current dicrectory contents in the container at /code

COPY ./requirements.txt /code/requirements.txt

# Install the requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Set up new user
RUN useradd user
#Switch
USER user

# Set home to the users home directory
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

#Set the working directory to the user's
WORKDIR $HOME/app

#Copy the current contents into the container
COPY --chown=user . $HOME/app 

# Start the FASTAPI app on port 7860
CMD ["uvicorn","app:app", "--host", "0.0.0.0", "--port", "7860"]