package cn.com.yisquare.processors.edi.dfdl;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;
import java.util.AbstractMap;
import java.util.Iterator;
import java.util.List;
import org.apache.daffodil.japi.Daffodil;
import org.apache.daffodil.japi.DataProcessor;
import org.apache.daffodil.japi.Diagnostic;
import org.apache.daffodil.japi.ParseResult;
import org.apache.daffodil.japi.ProcessorFactory;
import org.apache.daffodil.japi.UnparseResult;
import org.apache.daffodil.japi.ValidationMode;
import org.apache.daffodil.japi.infoset.InfosetInputter;
import org.apache.daffodil.japi.infoset.InfosetOutputter;
import org.apache.daffodil.japi.infoset.JsonInfosetInputter;
import org.apache.daffodil.japi.infoset.JsonInfosetOutputter;
import org.apache.daffodil.japi.infoset.XMLTextInfosetInputter;
import org.apache.daffodil.japi.infoset.XMLTextInfosetOutputter;
import org.apache.daffodil.japi.io.InputSourceDataInputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DFDLDataProcessor {
  private static final Logger LOGGER = LoggerFactory.getLogger(DFDLDataProcessor.class);
  
  private DataProcessor dataProcessor;
  
  public DFDLDataProcessor(URI uri, AbstractMap<String, String> variables, ValidationMode validationMode, boolean reloadFromDisk) throws Throwable {
    if (reloadFromDisk) {
      File binSchemaFile = new File(uri);
      this.dataProcessor = Daffodil.compiler().reload(binSchemaFile);
    } else {
      this.dataProcessor = compileSource(uri);
    } 
    if (variables != null)
      this.dataProcessor = this.dataProcessor.withExternalVariables(variables); 
    this.dataProcessor = this.dataProcessor.withValidationMode(validationMode);
    if (this.dataProcessor.isError()) {
      List<Diagnostic> diagnostics = this.dataProcessor.getDiagnostics();
      for (Diagnostic diagnostic : diagnostics)
        LOGGER.error(diagnostic.getMessage()); 
      throw ((Diagnostic)diagnostics.get(0)).getSomeCause();
    } 
    this.dataProcessor = this.dataProcessor;
  }
  
  protected DataProcessor compileSource(URI uri) throws Throwable {
    ProcessorFactory processorFactory = Daffodil.compiler().compileSource(uri);
    if (processorFactory.isError()) {
      List<Diagnostic> diagnostics = processorFactory.getDiagnostics();
      throw ((Diagnostic)diagnostics.get(0)).getSomeCause();
    } 
    DataProcessor dataProcessor = processorFactory.onPath("/");
    if (dataProcessor.isError()) {
      List<Diagnostic> diagnostics = dataProcessor.getDiagnostics();
      Iterator<Diagnostic> iterator = diagnostics.iterator();
      if (iterator.hasNext()) {
        Diagnostic diagnostic = iterator.next();
        throw diagnostic.getSomeCause();
      } 
    } 
    return dataProcessor;
  }
  
  public void parse(InputSourceDataInputStream dataInputStream, MediaType mediaType, OutputStream outputStream) throws Throwable {
    ParseResult res = this.dataProcessor.parse(dataInputStream, getInfosetOutputter(outputStream, mediaType));
    if (res.isError()) {
      List<Diagnostic> diagnostics = res.getDiagnostics();
      throw ((Diagnostic)diagnostics.get(0)).getSomeCause();
    } 
  }
  
  public void unParse(InputStream inputStream, MediaType mediaType, OutputStream outputStream) throws Throwable {
    WritableByteChannel output = Channels.newChannel(outputStream);
    UnparseResult result = this.dataProcessor.unparse(getInfosetInputter(inputStream, mediaType), output);
    if (result.isError()) {
      List<Diagnostic> diagnostics = result.getDiagnostics();
      throw ((Diagnostic)diagnostics.get(0)).getSomeCause();
    } 
  }
  
  private InfosetOutputter getInfosetOutputter(OutputStream outputStream, MediaType mediaType) {
    if (mediaType.equals(MediaType.XML))
      return (InfosetOutputter)new XMLTextInfosetOutputter(outputStream, false); 
    return (InfosetOutputter)new JsonInfosetOutputter(outputStream, false);
  }
  
  private InfosetInputter getInfosetInputter(InputStream inputStream, MediaType mediaType) {
    if (mediaType.equals(MediaType.XML))
      return (InfosetInputter)new XMLTextInfosetInputter(inputStream); 
    return (InfosetInputter)new JsonInfosetInputter(inputStream);
  }
}
