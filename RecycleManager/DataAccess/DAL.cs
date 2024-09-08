using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using static RecycleManager.DataAccess.DBTypeConverter;
namespace RecycleManager.DataAccess
{
    public class DAL
    {
        static string myconnstr = ConfigurationManager.ConnectionStrings["RecycleSystemConnection"].ConnectionString;
        SqlConnection conn = new SqlConnection(myconnstr);

        public bool ExecuteNonQuery(string procedureName, List<Tuple<string, object, SqlDbType>> parameters)
        {
            bool execStatus = false;
            try
            {
                var cmd = GetCommandWithParameters(procedureName, parameters);
                cmd.Connection.Open();
                var res = cmd.ExecuteScalar();
                execStatus = ((int)res) > 0;
            }
            catch { }
            return execStatus;
        }
        public Tuple<DataSet, bool> GetDataSet(string procedureName, string tableName, List<Tuple<string, object, SqlDbType>> parameters)
        {
            DataSet ds = new DataSet();
            bool execStatus = false;
            try
            {
                var cmd = GetCommandWithParameters(procedureName, parameters);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(ds, tableName);
                execStatus = true;
            }
            catch { }
            return new Tuple<DataSet, bool>(ds, execStatus);
        }

        public SqlCommand GetCommandWithParameters(string procedureName, List<Tuple<string, object, SqlDbType>> parameters)
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = procedureName;

            if (parameters != null && parameters.Any())
            {
                foreach (var parameter in parameters)
                {
                    SqlParameter param = new SqlParameter();
                    param.ParameterName = parameter.Item1;
                    param.Value = parameter.Item2;
                    param.Direction = ParameterDirection.Input;
                    param.DbType = GetDbType(parameter.Item3);
                    cmd.Parameters.Add(param);
                }
            }
            return cmd;
        }

        public DbType GetDbType(SqlDbType sqlDbType)
        {
            DbType dbType = DbType.String;
            DBTypeConverter dBTypeConverter = new DBTypeConverter();
            foreach (var dbTypeMap in DBTypeConverter.DBTypeList)
            {
                if (((DbTypeMapEntry)dbTypeMap).SqlDbType == sqlDbType)
                {
                    dbType = ((DbTypeMapEntry)dbTypeMap).DbType;
                    break;
                }
            }
            return dbType;
        }
    }
}