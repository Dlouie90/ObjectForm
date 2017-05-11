package formgenerator.model;


import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("FileUpload")
public class FormFile extends FormElement{

	private static final long serialVersionUID = 1L;	
	
	@Column(name = "fileLength")
	private Integer fileLength;
	
	@Column(name = "fileType")
	private String fileType;

	public Integer getFileLength() {
		return fileLength;
	}

	public void setFileLength(Integer fileLength) {
		this.fileLength = fileLength;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
}
