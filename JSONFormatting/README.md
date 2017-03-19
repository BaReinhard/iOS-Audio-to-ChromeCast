## How to use the tools inside this folder:


```
/home/brett/genSinks.sh > /home/brett/projects/node/public/app/sinks.json
tac /home/brett/projects/node/public/app/sinks.json | sed '2 s/,$//' | tac > /home/brett/projects/node/public/app/sinks.json.new
mv /home/brett/projects/node/public/app/sinks.{json.new,json}
```
