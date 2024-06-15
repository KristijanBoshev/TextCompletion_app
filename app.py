from fastapi import FastAPI
from transformers import pipeline

# Create new FastAPI instance
app = FastAPI()

# Initialize text-generation pipeline
pipe = pipeline("text2text-generation", model="google/flan-t5-small")

@app.get("/")
def home():
    return {"message":"Hello World"}

#Define a function to handle the GET request at /generate

@app.get("/generate")
def generate(text:str):
    #Use the pipeline to generate text based on the input text
    generated_text = pipe(text)

    #Return the generated text as a JSON response
    return {"generated_text":generated_text[0]["generated_text"]}