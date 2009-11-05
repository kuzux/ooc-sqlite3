include sqlite3

SqliteStruct: cover from sqlite3*
SqliteStmtStruct: cover from sqlite3_stmt*
SqliteValueStruct: cover from sqlite3_value*

SqliteValue: cover from SqliteValueStruct{
  toInt: extern(sqlite3_value_int) func -> Int
  toInt64: extern(sqlite3_value_int64) func -> Int64
  toDouble: extern(sqlite3_value_double) func -> Double
  toString: extern(sqlite3_value_text) func -> String
  toBlob: extern(sqlite3_value_blob) func -> Pointer
}

SqliteStmt: cover from SqliteStmtStruct {
  step: extern(sqlite3_step) func -> Int
  finalize: extern(sqlite3_finalize) func -> Int
  reset: extern(sqlite3_reset) func -> Int
  new: static func -> This {
    this := gc_malloc(This size) as This
    return this
  }

  columnCount: extern(sqlite3_column_count) func -> Int
  intColumn: extern(sqlite3_column_int) func(Int) -> Int
  int64Column: extern(sqlite3_column_int64) func(Int) -> Int64
  textColumn: extern(sqlite3_column_text) func(Int) -> String
  blobColumn: extern(sqlite3_column_blob) func(Int) -> Pointer
  doubleColumn: extern(sqlite3_column_blob) func(Int) -> Double
  valueColumn: extern(sqlite3_column_value) func(Int) -> SqliteValue

  bindParameterCount: extern(sqlite3_bind_parameter_count) func -> Int
  bindInt: extern(sqlite3_bind_int) func(Int, Int) -> Int
  bindInt64: extern(sqlite3_bind_int64) func(Int, Int64) -> Int
  bindNull: extern(sqlite3_bind_null) func(Int) -> Int
  bindDouble: extern(sqlite3_bind_double) func(Int, Double) -> Int
  _bind_text: extern(sqlite3_bind_text) func(Int, String, Int, Func(Pointer)) -> Int
  bindText: func(id: Int, text: String) -> Int {
    return this _bind_text(id, text, -1, -1)
  }
  _bind_blob: extern(sqlite3_bind_blob) func(Int, Pointer, Int, Func(Pointer)) -> Int
  bindBlob: func(id: Int, data: Pointer, size: Int) -> Int {
    return this _bind_blob(id, data, size, -1)
  }
  bindValue: extern(sqlite3_bind_value) func(Int, SqliteValue) -> Int

  columnName: extern(sqlite3_column_name) func(Int) -> String
  columnDb: extern(sqlite3_column_database_name) func(Int) -> String
  columnTable: extern(sqlite3_column_table_name) func(Int) -> String

  toString: extern(sqlite3_sql) func -> String

  toHashMap: func -> HashMap<SqliteValue>{
    res := HashMap<SqliteValue> new
    n := this columnCount()+1
    for(i in 1..n){
      name := this columnName(i)
      val := this valueColumn(i)
      res put(name, val)
    }
    return res
  }
}

Sqlite3: cover from SqliteStruct {
  _open: static extern(sqlite3_open) func(String, Sqlite3*) -> Int
  new: static func(file: String) -> This {
    this : This
    This _open(file, this&)
    return this
  }
  initialize: extern(sqlite3_initialize) static func -> Int
  close: extern(sqlite3_close) func -> Int

  errcode: extern(sqlite3_errcode) func -> Int
  errmsg: extern(sqlite3_errmsg) func -> String

  _prepare: extern(sqlite3_prepare_v2) func(String, Int, SqliteStmt*, const String*) -> Int
  prepare: func(query: String) -> SqliteStmt {
    res : SqliteStmt
    this _prepare(query, -1, res&, null)
    return res
  }
}

