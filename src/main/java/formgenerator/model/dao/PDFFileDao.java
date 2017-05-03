package formgenerator.model.dao;

import java.util.List;

import formgenerator.model.PDFFile;

public interface PDFFileDao {
	
	List<PDFFile> getPDFFiles();
	
	PDFFile getPDFFile(int fileId);
	
	void deletePDFFile(PDFFile pdfFile);
	
	PDFFile savePDFFile(PDFFile pdfFile);
	
}
