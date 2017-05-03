package formgenerator.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import formgenerator.model.PDFFile;
import formgenerator.model.dao.PDFFileDao;

@Repository
public class PDFFileDaoImpl implements PDFFileDao {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public List<PDFFile> getPDFFiles() {
		return entityManager.createQuery("from PDFFile order by fileId", PDFFile.class).getResultList();
	}

	@Override
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public PDFFile getPDFFile(int fileId) {
		return entityManager.find(PDFFile.class, fileId);
	}

	@Override
	@Transactional
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public void deletePDFFile(PDFFile pdfFile) {
		entityManager.remove(pdfFile);
	}

	@Override
	@Transactional
	@PreAuthorize("hasAuthority('Admin') || hasAuthority('Staff')")
	public PDFFile savePDFFile(PDFFile pdfFile) {
		return entityManager.merge(pdfFile);
	}

}
