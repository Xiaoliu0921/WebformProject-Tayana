using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace tayana
{
    public class DbHelper
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaSQLconnectionString"].ConnectionString);

        public void CloseDB()
        {
            connection.Close();
        }

        public SqlDataReader SearchDB(string sqlSentence, Dictionary<string, object> dict = null)
        {
            SqlDataReader rd;
            //設定SqlCommand物件(指令、連接)
            SqlCommand sqlCommand = new SqlCommand(sqlSentence, connection);

            //輸入SQL係數
            sqlCommand.Parameters.Clear();
            if (dict != null)
            {
                foreach (var item in dict)
                {
                    sqlCommand.Parameters.AddWithValue(item.Key, item.Value);
                }
            }

            //開啟資料庫
            connection.Open();
            rd = sqlCommand.ExecuteReader();

            return rd;
        }

        public Object SearchDBscalar(string sqlSentence, Dictionary<string, object> dict = null)
        {
            //設定SqlCommand物件(指令、連接)
            SqlCommand sqlCommand = new SqlCommand(sqlSentence, connection);

            //輸入SQL係數
            sqlCommand.Parameters.Clear();
            if (dict != null)
            {
                foreach (var item in dict)
                {
                    sqlCommand.Parameters.AddWithValue(item.Key, item.Value);
                }
            }

            //開啟資料庫
            connection.Open();

            return sqlCommand.ExecuteScalar();
        }

        public int NonQueryDB(string sqlSentence, Dictionary<string, object> dict = null)
        {
            //設定SqlCommand物件(指令、連接)
            SqlCommand sqlCommand = new SqlCommand(sqlSentence, connection);

            //輸入SQL係數
            sqlCommand.Parameters.Clear();
            if (dict != null)
            {
                foreach (var item in dict)
                {
                    sqlCommand.Parameters.AddWithValue(item.Key, item.Value);
                }
            }

            //開啟資料庫
            connection.Open();

            return sqlCommand.ExecuteNonQuery();
        }

    }
}