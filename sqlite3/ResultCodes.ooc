Sqlite3Code: cover {
  ok:          static extern(SQLITE_OK) Int          /* Successful result */
/* beginning-of-error-codes */
  error:       static extern(SQLITE_ERROR) Int       /* SQL error or missing database */
  internal:    static extern(SQLITE_INTERNAL) Int    /* Internal logic error in SQLite */
  perm:        static extern(SQLITE_PERM) Int        /* Access permission denied */
  abort:       static extern(SQLITE_ABORT) Int       /* Callback routine requested an abort */
  busy:        static extern(SQLITE_BUSY) Int        /* The database file is locked */
  locked:      static extern(SQLITE_LOCKED) Int      /* A table in the database is locked */
  nomem:       static extern(SQLITE_NOMEM) Int       /* A malloc() failed */
  readonly:    static extern(SQLITE_READONLY) Int    /* Attempt to write a readonly database */
  interrupt:   static extern(SQLITE_INTERRUPT) Int   /* Operation terminated by sqlite3_interrupt()*/
  ioerr:       static extern(SQLITE_IOERR) Int       /* Some kind of disk I/O error occurred */
  corrupt:     static extern(SQLITE_CORRUPT) Int     /* The database disk image is malformed */
  notfound:    static extern(SQLITE_NOTFOUND) Int    /* NOT USED. Table or record not found */
  full:        static extern(SQLITE_FULL) Int        /* Insertion failed because database is full */
  cantopen:    static extern(SQLITE_CANTOPEN) Int    /* Unable to open the database file */
  protocol:    static extern(SQLITE_PROTOCOL) Int    /* NOT USED. Database lock protocol error */
  empty:       static extern(SQLITE_EMPTY) Int       /* Database is empty */
  schema:      static extern(SQLITE_SCHEMA) Int      /* The database schema changed */
  toobig:      static extern(SQLITE_TOOBIG) Int      /* String or BLOB exceeds size limit */
  constraint:  static extern(SQLITE_CONSTRAINT) Int  /* Abort due to constraint violation */
  mismatch:    static extern(SQLITE_MISMATCH) Int    /* Data type mismatch */
  misuse:      static extern(SQLITE_MISUSE) Int      /* Library used incorrectly */
  nolfs:       static extern(SQLITE_NOLFS) Int       /* Uses OS features not supported on host */
  auth:        static extern(SQLITE_AUTH) Int        /* Authorization denied */
  format:      static extern(SQLITE_FORMAT) Int      /* Auxiliary database format error */
  range:       static extern(SQLITE_RANGE) Int       /* 2nd parameter to sqlite3_bind out of range */
  notadb:      static extern(SQLITE_NOTADB) Int      /* File opened that is not a database file */
  row:         static extern(SQLITE_ROW) Int         /* sqlite3_step() has another row ready */
  done:        static extern(SQLITE_DONE) Int        /* sqlite3_step() has finished executing */
}
