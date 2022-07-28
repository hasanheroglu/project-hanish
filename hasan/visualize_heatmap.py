from bokeh.plotting import figure, output_file, show
from bokeh.tile_providers import CARTODBPOSITRON, get_provider
from bokeh.colors import RGB
import json
from bokeh.models import GeoJSONDataSource
from bokeh.sampledata.sample_geojson import geojson
from message_consumer import get_data_from_topic
from projector import transform
import numpy
from bokeh.models import ColumnDataSource, LabelSet
from ksql import query

idx, response = query('select * from munich_heatmap_adv;', "localhost:8088")

area_code_idx = idx['area_code']
count_idx = idx['count']

area_code_count = {}

with response as rows:
    for row in rows: 
        row = json.loads(row.decode())
        area_code_count[row[area_code_idx]] = row[count_idx]

area_code_coord = { 'A1' : { 'lon': 11.49, 'lat': 48.086}, 'A2' : { 'lon': 11.51, 'lat': 48.086}, 'A3' : { 'lon': 11.53, 'lat': 48.086}, 'A4' : { 'lon': 11.55, 'lat': 48.086}, 'A5' : { 'lon': 11.57, 'lat': 48.086}, 'A6' : { 'lon': 11.59, 'lat': 48.086}, 'A7' : { 'lon': 11.61, 'lat': 48.086},
                    'B1' : { 'lon': 11.49, 'lat': 48.098}, 'B2' : { 'lon': 11.51, 'lat': 48.098}, 'B3' : { 'lon': 11.53, 'lat': 48.098}, 'B4' : { 'lon': 11.55, 'lat': 48.098}, 'B5' : { 'lon': 11.57, 'lat': 48.098}, 'B6' : { 'lon': 11.59, 'lat': 48.098}, 'B7' : { 'lon': 11.61, 'lat': 48.098},
                    'C1' : { 'lon': 11.49, 'lat': 48.11}, 'C2' : { 'lon': 11.51, 'lat': 48.11}, 'C3' : { 'lon': 11.53, 'lat': 48.11}, 'C4' : { 'lon': 11.55, 'lat': 48.11}, 'C5' : { 'lon': 11.57, 'lat': 48.11}, 'C6' : { 'lon': 11.59, 'lat': 48.11}, 'C7' : { 'lon': 11.61, 'lat': 48.11},
                    'D1' : { 'lon': 11.49, 'lat': 48.122}, 'D2' : { 'lon': 11.51, 'lat': 48.122}, 'D3' : { 'lon': 11.53, 'lat': 48.122}, 'D4' : { 'lon': 11.55, 'lat': 48.122}, 'D5' : { 'lon': 11.57, 'lat': 48.122}, 'D6' : { 'lon': 11.59, 'lat': 48.122}, 'D7' : { 'lon': 11.61, 'lat': 48.122},
                    'E1' : { 'lon': 11.49, 'lat': 48.134}, 'E2' : { 'lon': 11.51, 'lat': 48.134}, 'E3' : { 'lon': 11.53, 'lat': 48.134}, 'E4' : { 'lon': 11.55, 'lat': 48.134}, 'E5' : { 'lon': 11.57, 'lat': 48.134}, 'E6' : { 'lon': 11.59, 'lat': 48.134}, 'E7' : { 'lon': 11.61, 'lat': 48.134},
                    'F1' : { 'lon': 11.49, 'lat': 48.146}, 'F2' : { 'lon': 11.51, 'lat': 48.146}, 'F3' : { 'lon': 11.53, 'lat': 48.146}, 'F4' : { 'lon': 11.55, 'lat': 48.146}, 'F5' : { 'lon': 11.57, 'lat': 48.146}, 'F6' : { 'lon': 11.59, 'lat': 48.146}, 'F7' : { 'lon': 11.61, 'lat': 48.146}, 
                    'G1' : { 'lon': 11.49, 'lat': 48.158}, 'G2' : { 'lon': 11.51, 'lat': 48.158}, 'G3' : { 'lon': 11.53, 'lat': 48.158}, 'G4' : { 'lon': 11.55, 'lat': 48.158}, 'G5' : { 'lon': 11.57, 'lat': 48.158}, 'G6' : { 'lon': 11.59, 'lat': 48.158}, 'G7' : { 'lon': 11.61, 'lat': 48.158}, 
                    'H1' : { 'lon': 11.49, 'lat': 48.170}, 'H2' : { 'lon': 11.51, 'lat': 48.170}, 'H3' : { 'lon': 11.53, 'lat': 48.170}, 'H4' : { 'lon': 11.55, 'lat': 48.170}, 'H5' : { 'lon': 11.57, 'lat': 48.170}, 'H6' : { 'lon': 11.59, 'lat': 48.170}, 'H7' : { 'lon': 11.61, 'lat': 48.170}, 
                    'I1' : { 'lon': 11.49, 'lat': 48.182}, 'I2' : { 'lon': 11.51, 'lat': 48.182}, 'I3' : { 'lon': 11.53, 'lat': 48.182}, 'I4' : { 'lon': 11.55, 'lat': 48.182}, 'I5' : { 'lon': 11.57, 'lat': 48.182}, 'I6' : { 'lon': 11.59, 'lat': 48.182}, 'I7' : { 'lon': 11.61, 'lat': 48.182}
                }

x = []
y = []
alpha = []
labels = []

x_start, y_start = transform(11.48, 48.08)
x_end, y_end = transform(11.62, 48.188)

x_range = [x_start, x_end]
y_range = [y_start, y_end]
max_count = max(area_code_count.values())

for key, value in area_code_count.items():
    if key in area_code_coord.keys():
        x_new, y_new = transform(area_code_coord[key]['lon'], area_code_coord[key]['lat'])
        x.append(x_new)
        y.append(y_new)
        alpha.append(0.8 * (value/max_count))
        labels.append(key + ": " + str(value))

source = ColumnDataSource(data=dict(x=x,
    y=y,
    alpha=alpha,
    labels=labels))

output_file("heatmap.html")

tile_provider = get_provider(CARTODBPOSITRON)

# range bounds supplied in web mercator coordinates
p = figure(x_range=x_range, y_range=y_range, x_axis_type="mercator", y_axis_type="mercator")
p.add_tile(tile_provider)

p.rect('x', 'y', 2150, 1900, source=source, color='red', alpha='alpha')

labels = LabelSet(x='x', y='y', text='labels',
              x_offset=-13.5, y_offset=0, source=source, render_mode='canvas', text_font_size="6pt")
p.add_layout(labels)
show(p)
