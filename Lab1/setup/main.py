import fastapi
from pydantic import BaseModel
import subprocess

class Body(BaseModel):
    cmd: str

app = fastapi.FastAPI(root_path="/setup/test")

@app.post("/")
def test_route(body: Body):
    res = subprocess.run(["bash", "-c", body.cmd], capture_output=True)
    return res.stdout