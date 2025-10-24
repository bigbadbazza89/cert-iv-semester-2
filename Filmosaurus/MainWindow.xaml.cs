using System;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml.Linq;
using MySql.Data.MySqlClient;

namespace Filmosaurus
{

    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly MySql.Data.MySqlClient.MySqlConnection connection;
        private readonly string dbServer = "127.0.0.1";
        private readonly string dbPort = "3306";
        private readonly string dbName = "sakila";

        //ALWAYS read these out of my environment!
        private readonly string dbUser = "sakila_app_user";
        private readonly string dbPassword = "Hunter2!";
        public MainWindow()
        {
            InitializeComponent();
            connection = new MySql.Data.MySqlClient.MySqlConnection();
            connection.ConnectionString = $"server={dbServer};port={dbPort};database={dbName};uid={dbUser};pwd={dbPassword}";
            
        }

        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {
            FilmResults.Items.Clear();
            ErrorBox.Visibility = Visibility.Collapsed;
            string query = SearchBar.Text;

            string defaultQuery = $"select release_year, title, description from film where description like '%{query}%'";
            try
            {
                connection.Open();
                MySqlCommand command = new MySql.Data.MySqlClient.MySqlCommand(defaultQuery, connection);
                MySqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    FilmResults.Items.Add($"{reader.GetUInt16("release_year")}, {reader.GetString("title")}, {reader.GetString("description")}");


                }
            }

            catch (Exception ex)
            {
                MessageBox.Show($"Error connecting to database: {ex.Message}");
                return;
            }
            finally
            {
                connection.Close();
            }



        }
        private void SortingMode_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}