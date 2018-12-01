using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Schema;

namespace validator
{
    class Program
    {
        static void Main()
        {
            XmlReaderSettings partSettings = new XmlReaderSettings();
            partSettings.Schemas.Add("part", "./task1-explicit.xsd");
            partSettings.ValidationType = ValidationType.Schema;
            partSettings.ValidationEventHandler += new ValidationEventHandler(partSettingsValidationEventHandler);
            XmlReader parts = XmlReader.Create("./bad-xml.xml", partSettings);
            while (parts.Read()) { }
            Console.WriteLine("Тестирование завершено.");
        }

        static void partSettingsValidationEventHandler(object sender, ValidationEventArgs e)
        {
            if (e.Severity == XmlSeverityType.Warning)
            {
                Console.Write("WARNING: ");
                Console.WriteLine(e.Message);
            }
            else if (e.Severity == XmlSeverityType.Error)
            {
                Console.Write("ERROR: ");
                Console.WriteLine(e.Message);
            }
        }
    }
}