from pyproj import Transformer

lonlat_to_webmercator = Transformer.from_crs("EPSG:4326", "EPSG:3857", always_xy=True)

def transform(lon, lat):
    x, y = lonlat_to_webmercator.transform(lon, lat)
    return x, y
    