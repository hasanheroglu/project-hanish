'''Utilities for KSQL.'''

import urllib.request
import json

def query(query_str, server):
    '''Execute a query at a KSQLDB server.

    :param query_str: The KSQL query statement.
    :param server: The KSQLDB server to which to send the query.
    :return idx, response: A dict that maps column names to their indices
                           and the HTTP response object.
    '''
    def parse_header(header):
        '''Read column names and indices from the header.'''
        return { name.lower(): i for i, name in enumerate(header['columnNames']) }

    req = urllib.request.Request(
        url=f'http://{server}/query-stream',
        data=json.dumps({ 'sql': query_str, 'properties': {} }).encode(),
        method='POST'
    )
    req.add_header('Accept', 'application/vnd.ksqlapi.delimited.v1')

    res = urllib.request.urlopen(req)
    return parse_header(json.loads(res.readline().decode())), res

def statement(query_str, server):
    '''Execute a statement at a KSQLDB server.

    :param query_str: The KSQL query statement.
    :param server: The KSQLDB server to which to send the query.
    :return success, error: (True, None) if the statement was executed
                            successfully, (False, str) otherwise.
    '''
    def parse_header(header):
        '''Read column names and indices from the header.'''
        return { name.lower(): i for i, name in enumerate(header['columnNames']) }

    req = urllib.request.Request(
        url=f'http://{server}/ksql',
        data=json.dumps({ 'ksql': query_str, 'properties': {} }).encode(),
        method='POST'
    )
    req.add_header('Accept', 'application/vnd.ksql.v1+json')

    try:
        urllib.request.urlopen(req)
    except urllib.request.HTTPError as err:
        return False, err.read().decode()
    return True, None
