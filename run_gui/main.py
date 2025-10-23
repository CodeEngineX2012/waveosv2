import eel
import os

# Dynamically get the folder of this Python file
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Path to the folder containing index.html
WEB_FOLDER = os.path.join(BASE_DIR, 'gui')

# Initialize Eel with the HTML folder
eel.init(WEB_FOLDER)

@eel.expose
def py_hello():
    return "Running Local GUI Server..."

# Start the app; opens index.html in default browser
eel.start('index.html', size=(600, 400), block=True, mode='default')
