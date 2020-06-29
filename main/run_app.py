from fastapi import FastAPI
from app import api

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.post("/post_method/")
async def create_item(sent_data):
    response = sent_data + "post response!"
    return {"messege": "Successfully Done!", "response": response}


app.include_router(api.router)
