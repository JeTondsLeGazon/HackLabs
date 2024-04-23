import requests

r = requests.post("http://localhost/setup/test", data="hello")

print(r)