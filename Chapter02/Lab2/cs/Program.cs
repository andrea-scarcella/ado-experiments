using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Xml;

namespace TK70561
{
    class Program
    {
        static void Main(string[] args)
        {

            PagingDataAccessComponent thePagingComponent = new PagingDataAccessComponent();

            bool theResult = thePagingComponent.PageThroughProductTable();
                        
        }
           
    }
}

