from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def hello_world():
    """If we want to pass a python variable to the template or html page first make the object or varible then type pass"""
    name = "Rohit Sharma"
    return render_template('index.html', name=name)

@app.route('/sec')
def secfunc():
    """If we want to pass a python variable to the template or html page first make the object or varible then type pass"""
    cal = 34 * 2
    return render_template('index2.html', cal = cal)

app.run(debug=True)