'''Visualize latency measurements performed by `latency.py`.'''

import argparse
import pandas as pd
from scipy.signal import savgol_filter
from bokeh.plotting import figure, save, show

def main():
    '''Main.'''
    parser = argparse.ArgumentParser()
    parser.add_argument('file')
    parser.add_argument('-o', '--output', help='Output file. Optional.')
    args = parser.parse_args()

    y = []
    with open(args.file, 'r', encoding='UTF-8') as file:
        y = [float(line) for line in file]
    x = list(range(len(y)))

    # This approach is from https://stackoverflow.com/questions/63511090/how-can-i-smooth-data-in-python
    df = pd.DataFrame({ 'y': y })
    y_filtered = df[['y']].apply(savgol_filter, window_length=50, polyorder=3)['y']

    plot = figure(title='Message latency', x_axis_label='event', y_axis_label='latency (ms)')
    plot.line(x, y,          line_width=2, legend_label='raw', color='blue')
    plot.line(x, y_filtered, line_width=2, legend_label='smoothed', color='orange')

    if args.output:
        save(plot, args.output, title='Latency measurements')
    else:
        show(plot)

if __name__ == "__main__":
    main()
