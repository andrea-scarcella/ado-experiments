using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TK70561
{
    public class DataAccessComponent
    {
        public int GetAllProducts()
        {

            int rowCount = 0;

            try
            {
                ConnectionStringSettings theConnectionString = ConfigurationManager.ConnectionStrings["TK70561.Properties.Settings.VideoGameStoreDB"];

                SqlConnection theConnection = new SqlConnection(theConnectionString.ConnectionString);

                theConnection.Open();

                SqlCommand theCommand = new SqlCommand();
                theCommand.Connection = theConnection;
                theCommand.CommandText = "SELECT productId, productName, productDescription FROM product";
                theCommand.CommandType = System.Data.CommandType.Text;

                SqlDataReader theReader = theCommand.ExecuteReader();

                while (theReader.Read())
                {
                    rowCount++;
                }

                theReader.Close();
                theConnection.Close();
            }
            catch (SqlException aSqlException)
            {
                throw new ApplicationException("Exception Occured");
            }
            catch (Exception anException)
            {
                throw new ApplicationException("Exception Occured");
            }

            return rowCount;
        }
    }
}