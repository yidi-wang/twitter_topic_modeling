#!/usr/bin/env python
# vim: fileencoding=utf-8: noexpandtab


import pyodbc

class SimpleSQLServer:
    conn = None
    cur = None
    conf = None

    def __init__(self, **kwargs):
        self.conf = kwargs
        self.conf["keep_alive"] = kwargs.get("keep_alive", False)
        self.conf["charset"] = kwargs.get("charset", "utf8")

        self.connect()

    def connect(self):
        """Connect to the sql server"""

        try:
            self.conn = pyodbc.connect(DSN=self.conf['dsn'])
            self.cur = self.conn.cursor() 
        except:
            print ("SQL Server connection failed")
            raise


    def insert(self, table, data, ignore=True):
        """Insert a record"""

        query = self._serialize_insert(data)

        sql = "INSERT INTO %s (%s) VALUES(%s)" % (table, query[0], query[1])

        return self.query(sql, data.values()).rowcount
    
    def inserts(self, table, data, ignore=True):
        """Insert multiple records record"""
        rows = 0
        for row in data:
            rows += self.insert(table, row, ignore)
        return rows            

    def query(self, sql, params = None):
        """Run a raw query"""

        # check if connection is alive. if not, reconnect
        try:
            # print ("%s,%s",(sql, params))
            self.cur.execute(sql, params)
            self.conn.commit() 
        except pyodbc.Error, e:
            # sql server timed out. reconnect and retry once
            if e[1] == 'SQLSTATE HYT00' or 'HYT01':
                self.connect()
                self.cur.execute(sql, params)
                self.conn.commit()
            else:
                print("Query failed:\n%s \nError no %s, %s" % (sql, e[1],e[0]))
                raise
        except:
            raise

        return self.cur

    # ===

    def _serialize_insert(self, data):
        """Format insert dict values into strings"""
        keys = ",".join( data.keys() )
        vals = ",".join(["?" for k in data])

        return [keys, vals]
        
    def end(self):
        """Kill the connection"""
        self.cur.close()
        self.conn.close()