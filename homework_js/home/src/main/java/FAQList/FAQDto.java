package FAQList;

public class FAQDto {
	private String id;
	private String category;
	private String writer;
	private String question;
	private String answer;
	private String createDatetime;
	private String print;
	

	public FAQDto() {
		
	}
		
	public FAQDto(String id, String category, String writer, String question, String answer, String createDatetime,
			String print) {
		super();
		this.id = id;
		this.category = category;
		this.writer = writer;
		this.question = question;
		this.answer = answer;
		this.createDatetime = createDatetime;
		this.print = print;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getCreateDatetime() {
		return createDatetime;
	}
	public void setCreateDatetime(String createDatetime) {
		this.createDatetime = createDatetime;
	}
	public String getPrint() {
		return print;
	}
	public void setPrint(String print) {
		this.print = print;
	}
	
	
	
	
	
}
