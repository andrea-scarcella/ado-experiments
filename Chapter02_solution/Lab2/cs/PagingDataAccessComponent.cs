using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TK70561
{
    public class PagingDataAccessComponent
    {
        
        public bool PageThroughProductTable()
        {
            string returnMessage = String.Empty;
            bool anError = false;

            try
            {

                ConnectionStringSettings theConnectionString = ConfigurationManager.ConnectionStrings["TK70561.Properties.Settings.VideoGameStoreDB"];

                SqlConnection theConnection = new SqlConnection(theConnectionString.ConnectionString);

                theConnection.Open();

                SqlCommand theCommand = new SqlCommand();
                theCommand.Connection = theConnection;

                theCommand.CommandText = "SELECT * FROM product";
                theCommand.CommandType = CommandType.Text;

                // DataSet
                SqlDataAdapter theDataAdapter = new SqlDataAdapter(theCommand);

                int startPosition = 1;
                int recordsToRetrieve = 10;
                int pageNumber = 1;
                bool readData = true;
                ConsoleKeyInfo theKey;
                DataSet localDataSet;

                do
                {
                    try
                    {
                        localDataSet = GetPagedData(theDataAdapter, "productsbyname", startPosition, recordsToRetrieve);

                        if (localDataSet.Tables["productsbyname"].Rows.Count > 0)
                        {
                            Console.WriteLine("\n\n");
                            Console.WriteLine("------ Page " + pageNumber.ToString() + "".PadRight(30, '-'));
                            Console.WriteLine("\n\n");

                            foreach (DataRow theRow in localDataSet.Tables["productsbyname"].Rows)
                            {
                                Console.WriteLine(theRow["ProductName"].ToString() + "\t" + theRow["ReleaseDate"].ToString() + "\n");
                            }
                            Console.WriteLine("\n\n Press F to page data forwards or B for backwards (or Q to exit)");
                            theKey = Console.ReadKey(true);
                            if (theKey.Key == ConsoleKey.F)
                            {
                                if (localDataSet.Tables["productsbyname"].Rows.Count == recordsToRetrieve)
                                {
                                    startPosition += recordsToRetrieve;
                                    pageNumber++;
                                }
                                else
                                {
                                    Console.WriteLine("Already at end of data");
                                }
                            }
                            else if (theKey.Key == ConsoleKey.Q)
                            {
                                break;
                            }
                            else if (theKey.Key == ConsoleKey.B)
                            {
                                if (pageNumber > 1)
                                {
                                    startPosition -= recordsToRetrieve;
                                    pageNumber--;
                                }
                                else
                                    Console.WriteLine("Already at start of data");
                            }
                        }
                        else
                        {
                            readData = false;
                        }
                    }
                    catch (Exception ex)
                    {
                        anError = true;
                        readData = false;
                    }
                } while (readData);

                theConnection.Close();

            }
            catch (Exception exception)
            {
                anError = true;
            }

            return anError;
        }

        private static DataSet GetPagedData(SqlDataAdapter theDataAdapter, string tableName, int startPosition, int recordCount)
        {
            DataSet theDataSet = new DataSet();

            try
            {
                theDataAdapter.Fill(theDataSet, startPosition, recordCount, tableName);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            return theDataSet;
        }

    }
}
