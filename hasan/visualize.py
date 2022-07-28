from bokeh.plotting import figure, output_file, show
from bokeh.tile_providers import CARTODBPOSITRON, get_provider
from bokeh.colors import RGB
import json
from bokeh.models import GeoJSONDataSource
from bokeh.sampledata.sample_geojson import geojson
from message_consumer import get_data_from_topic
from projector import transform
import numpy

data = get_data_from_topic()

x = []
y = []

x_range = [1269042.1950433187, 1313569.9913606283]
y_range = [6115177.087951664, 6156910.055358623]

x_slots = [x_t for x_t in numpy.arange(x_range[0], x_range[1], (x_range[1]-x_range[0])/44)]
x_slots.append(x_range[1])
y_slots = [y_t for y_t in numpy.arange(y_range[0], y_range[1], (y_range[1]-y_range[0])/27)]
y_slots.append(y_range[1])

heatmap = numpy.ones(44*27).reshape(44, 27)

for i in data:
    if i["LON"] and i["LAT"]:
        x_new, y_new = transform(i["LON"], i["LAT"])

        for j in range(45 - 1):
            if x_slots[j] <= x_new <= x_slots[j+1]:  
                for k in range(28 - 1):
                    if y_slots[k] <= y_new <= y_slots[k+1]:
                        heatmap[j][k] += 1

        x.append(x_new)
        y.append(y_new)

output_file("tile.html")

tile_provider = get_provider(CARTODBPOSITRON)

# range bounds supplied in web mercator coordinates
p = figure(x_range=x_range, y_range=y_range, x_axis_type="mercator", y_axis_type="mercator")
p.add_tile(tile_provider)

# p.circle(x=x, y=y, size=12, color=RGB(1.0, 0.5, 0.5), alpha=0.1)

print(heatmap.argmax())

#p.square(x=x_slots,y=y_slots, size=12, color='red', alpha=1.0)

'''
for i in range(45 - 1):
    for j in range(28 - 1):
        p.square(x= (x_slots[i+1]+x_slots[i])/2,y=(y_slots[j+1]+y_slots[j])/2, size=12, color='red', alpha=(100*(heatmap[i][j]/heatmap.argmax())))
'''
p.square(x=x, y=y, size=8, color='red', alpha=0.1)
show(p)