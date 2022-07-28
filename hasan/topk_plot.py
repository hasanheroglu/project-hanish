# importing the modules
from bokeh.plotting import figure, output_file, show
from bokeh.transform import factor_cmap
from bokeh.palettes import Spectral5
from bokeh.models import ColumnDataSource, LabelSet

# file to save the model
output_file("topk.html")
  
# x-coordinates to be plotted
cities = ['Paris', 'Berlin', 'Madrid', 'Barcelona', 'London']

# x-coordinates of the top edges
top = [619, 655, 971, 1165, 3884]
labels = ['619', '655', '971', '1165', '3884']
  
# width / thickness of the bars
width = 0.5

source = ColumnDataSource(data=dict(cities=cities, top=top, labels=labels))

cities_cmap = factor_cmap('cities', palette=Spectral5, factors=cities)

# plotting the graph
p = figure(x_range = cities, title='TopK Cities')
p.vbar(x = 'cities', top = 'top', source=source, width = 0.9, line_color=cities_cmap, fill_color=cities_cmap)

labels = LabelSet(x='cities', y='top', text='labels',
              x_offset=-13.5, y_offset=0, source=source, render_mode='canvas')

p.xgrid.grid_line_color = None
p.y_range.start = 0

p.add_layout(labels)
# displaying the model
show(p)
