import javax.xml.parsers.*; // DocumentBuilder, DocumentBuilderFactory
import org.xml.sax.*; // SAXException, SAXParseException
import org.w3c.dom.*; // Document, DOMException
import javax.xml.transform.*; // Transformer, TransformerFactory
import javax.xml.transform.dom.*; // DOMSource;
import javax.xml.transform.stream.*; // StreamResult, StreamSource
import java.io.*;
public class XSLTransform {
    static Document document; // Valor global referenciado pelo tree-adapter
    public static void main (String argv []) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();
            document = builder.parse("catalogo.xml");
            TransformerFactory tFactory = TransformerFactory.newInstance();
            StreamSource stylesheet = new StreamSource("catalogo.xsl");
            Transformer transformer = tFactory.newTransformer(stylesheet);
            DOMSource source = new DOMSource(document);
            StreamResult result = new StreamResult(System.out);
            transformer.transform(source, result);
        } catch (TransformerConfigurationException tce) {
            // Erro gerado pelo parser
            System.out.println ("\n** Erro de Transformer Factory");
            System.out.println(" " + tce.getMessage() );
        } catch (TransformerException te) { 
            // Erro gerado pelo transformador
            System.out.println ("\n** Erro de Transformação");
            System.out.println(" " + te.getMessage() );
        } catch (SAXParseException spe) { // Erro gerado pelo parser
            System.out.println ("\n** Erro de Parser");
            System.out.println(" " + spe.getMessage() );
        } catch (SAXException sxe) {
            // Erro gerado pelo aplicativo
            // (ou erro de inicialização do parser)
            Exception x = sxe;
            if (sxe.getException() != null) x = sxe.getException();
            x.printStackTrace();
        } catch (ParserConfigurationException pce) {
            // Opções especificadas não podem criar o Parser
            pce.printStackTrace();
        } catch (IOException ioe) { // Erro de E/S
            ioe.printStackTrace();
        }
    } // main
}
