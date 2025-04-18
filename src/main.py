from fastapi import FastAPI, Request
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
import yaml
from pathlib import Path

app = FastAPI(title="Jersey Flora Guide")

# Mount static files
app.mount("/assets", StaticFiles(directory="assets"), name="assets")

# Templates
templates = Jinja2Templates(directory="src/templates")

def load_plant(plant_file: Path) -> dict:
    """Load plant data from YAML file."""
    with open(plant_file, 'r') as f:
        return yaml.safe_load(f)

def load_all_plants() -> dict:
    """Load all plant data from YAML files."""
    plants = {
        'trees': [],
        'wildflowers': []
    }
    
    data_dir = Path('data/plants')
    
    # Load trees
    for plant_file in (data_dir / 'trees').glob('*.yaml'):
        plant_data = load_plant(plant_file)
        plants['trees'].append(plant_data)
    
    # Load wildflowers
    for plant_file in (data_dir / 'wildflowers').glob('*.yaml'):
        plant_data = load_plant(plant_file)
        plants['wildflowers'].append(plant_data)
    
    return plants

@app.get("/")
async def home(request: Request):
    """Home page with all plants."""
    plants = load_all_plants()
    return templates.TemplateResponse(
        "index.html",
        {"request": request, "plants": plants}
    )

@app.get("/plant/{plant_id}")
async def plant_detail(request: Request, plant_id: str):
    """Individual plant detail page."""
    # Search in both trees and wildflowers directories
    data_dir = Path('data/plants')
    plant_data = None
    
    for category in ['trees', 'wildflowers']:
        plant_file = data_dir / category / f"{plant_id}.yaml"
        if plant_file.exists():
            plant_data = load_plant(plant_file)
            break
    
    if plant_data is None:
        return {"error": "Plant not found"}, 404
    
    return templates.TemplateResponse(
        "plant_detail.html",
        {"request": request, "plant": plant_data}
    ) 