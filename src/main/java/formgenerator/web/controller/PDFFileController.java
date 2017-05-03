package formgenerator.web.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import formgenerator.model.PDFFile;
import formgenerator.model.dao.MemberDAO;
import formgenerator.model.dao.PDFFileDao;

@Controller
@SessionAttributes("pdfFile")
public class PDFFileController {
	
	@Autowired
	private PDFFileDao pdfFileDao;
	
	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping(value="pdffile/list.html")
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public String listPDfFiles(ModelMap modelMap) {
		modelMap.put("pdfFiles", pdfFileDao.getPDFFiles());
		return "pdffile/list";
	}
	
	@RequestMapping(value = "pdffile/upload.html", method = RequestMethod.GET)
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public String PDFFileUpload() {
		return "pdffile/upload";
	}
	
	@RequestMapping(value = "pdffile/upload.html", method = RequestMethod.POST)
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public String PDFFileUpload( @RequestParam MultipartFile PDFFile, ModelMap modelMap, Principal principal ) throws IllegalStateException, IOException {
		if (PDFFile.isEmpty()) {
            modelMap.put("errorMessage", "Please select a file to upload.");
            return "pdffile/upload";
        }
		
		if (!PDFFile.getOriginalFilename().split("\\.")[1].equals("pdf")) {
            modelMap.put("errorMessage", "You can upload only PDF files.");
            return "pdffile/upload";
        }

		if(PDFFile.getSize() > 20971520) {
			modelMap.put("errorMessage", "You can upload only PDF files of size up to 20MB.");
            return "pdffile/upload";
		}
		
		Date createdDate = new Date();
		PDFFile pdfFile = new PDFFile();
		pdfFile.setFileName(PDFFile.getOriginalFilename());
		pdfFile.setFileContent(PDFFile.getBytes());
		pdfFile.setCreatedDate(new java.sql.Timestamp(createdDate.getTime()));
		pdfFile.setModifiedDate(new java.sql.Timestamp(createdDate.getTime()));
		pdfFile.setOwnedBy(memberDao.getMemberbyUserName(principal.getName()));
		pdfFileDao.savePDFFile(pdfFile);
		
		return "redirect:list.html";
	}
	
	@RequestMapping(value = "pdffile/rename.html", method = RequestMethod.GET)
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public String renamePDFFile(@RequestParam int fileId, ModelMap modelMap) {
		PDFFile pdfFile = pdfFileDao.getPDFFile(fileId);
		modelMap.put("pdfFile", pdfFile);
		return "pdffile/rename";
	}
	
	@RequestMapping(value = "pdffile/rename.html", method = RequestMethod.POST)
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public String renamePDFFile(@ModelAttribute PDFFile pdfFile, SessionStatus status) {
		Date modifiedDate = new Date();
		PDFFile renamePDFFile = pdfFileDao.getPDFFile(pdfFile.getFileId());
		renamePDFFile.setFileName(pdfFile.getFileName());
		renamePDFFile.setModifiedDate(new java.sql.Timestamp(modifiedDate.getTime()));
		pdfFileDao.savePDFFile(renamePDFFile);
		status.setComplete();
		return "redirect:list.html";
	}
	
	@RequestMapping(value = "pdffile/view.html")
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public String viewPDFFile(@RequestParam int fileId, HttpServletResponse response) throws IOException {
		PDFFile pdfFile = pdfFileDao.getPDFFile(fileId);
		byte[] documentInBytes = pdfFile.getFileContent();         
        response.setHeader("Content-Disposition", "inline; filename = \"" + pdfFile.getFileName() +"\"");
        response.setDateHeader("Expires", -1);
        response.setContentType("application/pdf");
        response.setContentLength(documentInBytes.length);
        response.getOutputStream().write(documentInBytes);
		return null;
	}
	
	@RequestMapping(value = "pdffile/download.html")
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public String downloadPDFFile(@RequestParam int fileId, HttpServletResponse response) throws IOException {
		PDFFile pdfFile = pdfFileDao.getPDFFile(fileId);
		response.setContentType(".pdf");
        response.setContentLength(pdfFile.getFileContent().length);
        response.setHeader("Content-Disposition", "attachment; filename = \"" + pdfFile.getFileName() +"\"");
        FileCopyUtils.copy(pdfFile.getFileContent(), response.getOutputStream());
		return null;
	}
	
	@RequestMapping(value = "pdffile/delete.html")
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public String deletePDFFile(@RequestParam int fileId) {
		PDFFile pdfFile = pdfFileDao.getPDFFile(fileId);
		pdfFileDao.deletePDFFile(pdfFile);
		return "redirect:list.html";
	}
	
}
