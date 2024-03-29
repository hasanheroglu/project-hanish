CREATE TABLE MUNICH_HEATMAP_ADV WITH(KAFKA_TOPIC = 'munich-heatmap-adv') AS
SELECT  (CASE 
            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.08 AND lat < 48.092) THEN 'A1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.08 AND lat < 48.092) THEN 'A2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.08 AND lat < 48.092) THEN 'A3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.08 AND lat < 48.092) THEN 'A4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.08 AND lat < 48.092) THEN 'A5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.08 AND lat < 48.092) THEN 'A6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.08 AND lat < 48.092) THEN 'A7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.092 AND lat < 48.104) THEN 'B1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.092 AND lat < 48.104) THEN 'B2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.092 AND lat < 48.104) THEN 'B3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.092 AND lat < 48.104) THEN 'B4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.092 AND lat < 48.104) THEN 'B5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.092 AND lat < 48.104) THEN 'A6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.092 AND lat < 48.104) THEN 'A7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.104 AND lat < 48.116) THEN 'C1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.104 AND lat < 48.116) THEN 'C2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.104 AND lat < 48.116) THEN 'C3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.104 AND lat < 48.116) THEN 'C4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.104 AND lat < 48.116) THEN 'C5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.104 AND lat < 48.116) THEN 'C6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.104 AND lat < 48.116) THEN 'C7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.116 AND lat < 48.128) THEN 'D1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.116 AND lat < 48.128) THEN 'D2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.116 AND lat < 48.128) THEN 'D3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.116 AND lat < 48.128) THEN 'D4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.116 AND lat < 48.128) THEN 'D5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.116 AND lat < 48.128) THEN 'D6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.116 AND lat < 48.128) THEN 'D7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H7'
            ELSE 'U0'
        END), COUNT(*) FROM MUNICH_HEATMAP GROUP BY (CASE 
            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.08 AND lat < 48.092) THEN 'A1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.08 AND lat < 48.092) THEN 'A2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.08 AND lat < 48.092) THEN 'A3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.08 AND lat < 48.092) THEN 'A4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.08 AND lat < 48.092) THEN 'A5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.08 AND lat < 48.092) THEN 'A6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.08 AND lat < 48.092) THEN 'A7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.092 AND lat < 48.104) THEN 'B1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.092 AND lat < 48.104) THEN 'B2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.092 AND lat < 48.104) THEN 'B3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.092 AND lat < 48.104) THEN 'B4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.092 AND lat < 48.104) THEN 'B5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.092 AND lat < 48.104) THEN 'A6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.092 AND lat < 48.104) THEN 'A7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.104 AND lat < 48.116) THEN 'C1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.104 AND lat < 48.116) THEN 'C2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.104 AND lat < 48.116) THEN 'C3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.104 AND lat < 48.116) THEN 'C4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.104 AND lat < 48.116) THEN 'C5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.104 AND lat < 48.116) THEN 'C6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.104 AND lat < 48.116) THEN 'C7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.116 AND lat < 48.128) THEN 'D1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.116 AND lat < 48.128) THEN 'D2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.116 AND lat < 48.128) THEN 'D3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.116 AND lat < 48.128) THEN 'D4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.116 AND lat < 48.128) THEN 'D5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.116 AND lat < 48.128) THEN 'D6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.116 AND lat < 48.128) THEN 'D7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.128 AND lat <= 48.14) THEN 'E7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.14 AND lat <= 48.152) THEN 'F7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.152 AND lat <= 48.164) THEN 'G7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.164 AND lat <= 48.176) THEN 'H7'

            WHEN (lon >= 11.48 AND lon < 11.5) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H1'
            WHEN (lon >= 11.5 AND lon < 11.52) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H2'
            WHEN (lon >= 11.52 AND lon < 11.54) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H3'
            WHEN (lon >= 11.54 AND lon < 11.56) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H4'
            WHEN (lon >= 11.56 AND lon < 11.58) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H5'
            WHEN (lon >= 11.58 AND lon < 11.6) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H6'
            WHEN (lon >= 11.6 AND lon <=11.62) AND (lat >= 48.176 AND lat <= 48.188) THEN 'H7'
            ELSE 'U0'
        END);