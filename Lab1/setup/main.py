import fastapi
from pydantic import BaseModel
import subprocess

class Body(BaseModel):
    path: str

app = fastapi.FastAPI(root_path="/setup/test")

@app.post("/")
def test_route(body: Body):
    path = body.path.split("&")[0].split(";")[0]
    res = subprocess.run(["bash", "-c", f"ls {path}"], capture_output=True)
    return res.stdout