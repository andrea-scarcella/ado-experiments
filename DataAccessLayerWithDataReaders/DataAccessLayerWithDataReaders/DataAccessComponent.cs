using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
namespace DataAccessLayerWithDataReaders
{
    public class DataAccessComponent
    {
        public int GetAllProducts()
        {

            string connectionString = Properties.Settings.Default["VideoGameStoreDB"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            int rowCount = 0;
            try
            {
                conn.Open();
                if (conn.State == System.Data.ConnectionState.Open)
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = @"
SELECT [ProductID]
      ,[ProductName]
      ,[ProductDescription]
      
  FROM [VideoGames].[dbo].[Product]
";
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.HasRows)
                    {
                        while (rdr.Read())
                        {
                            //Console.Write(rdr.GetString(0) + "|");
                            //Console.Write(rdr.GetString(1) + "|");
                            //Console.Write(rdr.GetString(2) + "|");
                            //Console.WriteLine();
                            rowCount++;
                        }
                    }
                    rdr.Close();
                    conn.Close();
                }
            }
            catch (SqlException se)
            {
                throw;
            }
            catch (Exception e)
            {

                throw;
            }
            return rowCount;
        }
    }
}
