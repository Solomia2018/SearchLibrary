import  java.awt.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import  javax.swing.*;
import javax.swing.text.DateFormatter;
@SuppressWarnings({ "rawtypes", "unchecked" })
public class Search {
	Driver db;
	JFrame frame;
	JButton searchB;
    JButton showB;
    JTextField autherT;
	JTextField wordT;
	JTextField topicT;
	JTextField typeT;JFormattedTextField dateFieldF;
	JFormattedTextField dateFieldT;
	ResultSet res;
	Statement st;
	JButton okB;
	JPasswordField pass;
	JTextField login;
	static Search window;
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					window = new Search();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	public Search() throws SQLException {

		initializeLogin();
		okB.addActionListener(e -> {
			if(!login.getText().isEmpty() && !pass.getPassword().toString().isEmpty()){
				db=new Driver(login.getText(),String.valueOf(pass.getPassword()));
			try {
				window.frame.setVisible(false);
				initMain();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			}
			else JOptionPane.showMessageDialog(null, "Your data is wrong!");
		}) ;
		
	}
	private void addTableSearchRes(ArrayList data) {
		if(data.isEmpty()) JOptionPane.showMessageDialog(null, "Your data is wrong!");
		else{
			
			String[] names={" ","Identity","Name"};
			Class[] types={String.class,String.class,String.class};
			ShowTable tab=new ShowTable(types,names);
			tab.names=names;
			tab.types=types;
		tab.dbm.setDataSource(data,names,types);
		frame=tab;
		frame.setBounds(200, 200, 650, 410);
		frame.setVisible(true);
		}
	}
	public void initMain() throws SQLException{
			initializeAdd();
		searchB.addActionListener(e -> {
			ArrayList id=null; 
			try {
				ArrayList name=new ArrayList();
				name=searchData();
			if(name==null)JOptionPane.showMessageDialog(null, "Your data is wrong!");
			else{
				id= getResult(name);
				ArrayList oneRow=new ArrayList();
				ArrayList all=new ArrayList();
				for(int i=0;i<name.size();i++){
					oneRow=new ArrayList();
				oneRow.add(id.get(i));
				oneRow.add(name.get(i));
				
				all.add(oneRow);}
				addTableSearchRes(all);}
			} catch (SQLException e1) {
			
				e1.printStackTrace();
			}
		}) ;
		 showB.addActionListener(e -> {
			 ArrayList id;
			try {
				id = getRating();
				addTable(id);
			} catch (SQLException e1) {
				e1.printStackTrace();
			} 
			 
		}) ;
		 }
	private void initializeLogin() throws SQLException {

		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JPanel contents = new JPanel();
        contents.setLayout(new BoxLayout(contents,BoxLayout.Y_AXIS));
        JPanel pnName = new JPanel();
        pnName.setLayout(new BoxLayout(pnName,BoxLayout.X_AXIS));
		JLabel search=new JLabel("Login in");
		pnName.add(search);
		JPanel pnAuther = new JPanel();
        pnAuther.setLayout(new BoxLayout(pnAuther,BoxLayout.X_AXIS));
		JLabel auther=new JLabel("Login:  ");
		pnAuther.add(auther);
		login=new JTextField(15);
		login.setMaximumSize(login.getPreferredSize());
		pnAuther.add(login);
		JPanel pnWord = new JPanel();
        pnWord.setLayout(new BoxLayout(pnWord,BoxLayout.X_AXIS));
		JLabel word=new JLabel("Password:  ");
		pnWord.add(word);
		pass=new JPasswordField(15);
		pass.setMaximumSize(pass.getPreferredSize());
		pnWord.add(pass);
		JPanel pnButtons = new JPanel();
        pnButtons.setLayout(new BoxLayout(pnButtons,BoxLayout.X_AXIS));
       okB=new JButton("Ok");
        pnButtons.add(okB);
		frame.setContentPane(contents);
		contents.add(Box.createGlue());
		contents.add(pnName);
		contents.add(Box.createGlue());
		contents.add(pnAuther);
		contents.add(Box.createGlue());
		contents.add(pnWord);
		contents.add(Box.createGlue());
		contents.add(pnButtons);
	}

	private void initializeAdd() throws SQLException {
		st=db.creatStatment();	
		window.frame = new JFrame();
		window.frame.setBounds(100, 100, 450, 300);
		window.frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		window.frame.setVisible(true);
		JPanel contents = new JPanel();
        contents.setLayout(new BoxLayout(contents,BoxLayout.Y_AXIS));
        JPanel pnName = new JPanel();
        pnName.setLayout(new BoxLayout(pnName,BoxLayout.X_AXIS));
		JLabel search=new JLabel("Search");
		pnName.add(search);
		JPanel pnAuther = new JPanel();
        pnAuther.setLayout(new BoxLayout(pnAuther,BoxLayout.X_AXIS));
		JLabel auther=new JLabel("Auther:  ");
		pnAuther.add(auther);
		autherT=new JTextField(15);
		autherT.setMaximumSize(autherT.getPreferredSize());
		pnAuther.add(autherT);
		JPanel pnWord = new JPanel();
        pnWord.setLayout(new BoxLayout(pnWord,BoxLayout.X_AXIS));
		JLabel word=new JLabel("Key word:  ");
		pnWord.add(word);
		wordT=new JTextField(15);
		wordT.setMaximumSize(wordT.getPreferredSize());
		pnWord.add(wordT);
		JPanel pnTopic = new JPanel();
        pnTopic.setLayout(new BoxLayout(pnTopic,BoxLayout.X_AXIS));
		JLabel topic=new JLabel("Topic:  ");
		pnTopic.add(topic);
		 topicT=new JTextField(15);
		topicT.setMaximumSize(topicT.getPreferredSize());
		pnTopic.add(topicT);
		JPanel pnType = new JPanel();
        pnType.setLayout(new BoxLayout(pnType,BoxLayout.X_AXIS));
		JLabel type=new JLabel("Type:  ");
		pnType.add(type);
		typeT=new JTextField(15);
		typeT.setMaximumSize(typeT.getPreferredSize());
		pnType.add(typeT);
		JPanel pnDate = new JPanel();
        pnDate.setLayout(new BoxLayout(pnDate,BoxLayout.X_AXIS));
		JLabel from=new JLabel("From:  ");
		pnDate.add(from);
		DateFormatter dateFormatter=new DateFormatter(new SimpleDateFormat("yyyy-mm-dd"));
	dateFieldF = new JFormattedTextField(dateFormatter);
		dateFieldF.setMaximumSize(autherT.getPreferredSize());
		pnDate.add(dateFieldF);
		JLabel to=new JLabel("To:  ");
		pnDate.add(to);
		dateFieldT = new JFormattedTextField(dateFormatter);
		dateFieldT.setMaximumSize(autherT.getPreferredSize());
		pnDate.add(dateFieldT);
		JPanel pnButtons = new JPanel();
        pnButtons.setLayout(new BoxLayout(pnButtons,BoxLayout.X_AXIS));
        searchB=new JButton("Search");
        
        showB=new JButton("Show Rating");
        JLabel space=new JLabel("    ");
        pnButtons.add(searchB);
        pnButtons.add(space);
        pnButtons.add(showB);
		frame.setContentPane(contents);
		contents.add(Box.createGlue());
		contents.add(pnName);
		contents.add(Box.createGlue());
		contents.add(pnAuther);
		contents.add(Box.createGlue());
		contents.add(pnTopic);
		contents.add(Box.createGlue());
		contents.add(pnType);
		contents.add(Box.createGlue());
		contents.add(pnWord);
		contents.add(Box.createGlue());
		contents.add(pnDate);
		contents.add(Box.createGlue());
		contents.add(pnButtons);
	}
private ArrayList getResult(ArrayList searchRes) throws SQLException {
		ArrayList id=new ArrayList();
		if(!searchRes.isEmpty()){
		for(int i=0;i<searchRes.size();i++){
			String que="Select number FROM identity "
					+ "Where id_scientific_publish IN(SELECT id_scientific_publish from book"
					+ " WHERE id IN(SELECT id_book from book_publish "
					+ "WHERE id_publish IN(SELECT id FROM publish WHERE name='"+(searchRes.get(i))+"')))";
			
			String que1="Select number FROM identity "
					+ "Where id_scientific_publish IN(SELECT id_scientific_publish from zbirnik"
					+ " WHERE id IN(SELECT id from zbirnik_publish "
					+ "WHERE id_publish IN(SELECT id FROM publish WHERE name='"+searchRes.get(i)+"')))";
			ResultSet res=st.executeQuery(que);
			while(res.next()){
				id.add(res.getInt(1));
				if(res.isLast())break;
			}
	 res=st.executeQuery(que1);
		while(res.next()){
			id.add(res.getInt(1));
			if(res.isLast())break;
		}
				}
		return id;}
		else
		return null;
	}
private ArrayList<ArrayList> getRating() throws SQLException{
	ArrayList result=new ArrayList();
	ArrayList result1=new ArrayList();
	String que="Select identity.number,publish.name,COUNT(in_work.id_identity) as num,MAX(in_work.give) as dates FROM identity,publish,book,book_publish,in_work "
			+ " WHERE book.id_scientific_publish=identity.id_scientific_publish"
			+ " AND in_work.id_identity=identity.id "
			+ " AND book_publish.id_book=book.id "
			+ " AND publish.id=book_publish.id_publish "
			+ " GROUP BY in_work.id_identity "
			+ " Order BY num desc,dates desc;";
			
			ResultSet res=st.executeQuery(que);
			
	while(res.next()){
		result=new ArrayList();
		result.add(res.getInt(1));
		result.add(res.getString(2));
		result.add(res.getInt(3));
		result.add(res.getDate(4));
		result1.add(result);
		}
	return result1;
}
private void addTable(ArrayList data){
	
	String[] names={" ","Identity","Name","Number","Date"};
	Class[] types={String.class,String.class,String.class,String.class,String.class};
	ShowTable tab=new ShowTable(types,names);
	tab.names=names;
	tab.types=types;
tab.dbm.setDataSource(data,names,types);
	frame=tab;
	frame.setBounds(200, 200, 650, 410);
	frame.setVisible(true);
}

private ArrayList searchData() throws SQLException{
	String auther=autherT.getText();
	String word=wordT.getText();
	String topic=topicT.getText();
	String type=typeT.getText();
	String dateFieldf=dateFieldF.getText();
	String dateFieldt=dateFieldT.getText();
	
	ArrayList result=new ArrayList();
	ArrayList result1=new ArrayList();
	ArrayList result2=new ArrayList();
	ArrayList result3=new ArrayList();
	ArrayList result4=new ArrayList();
	ArrayList result5=new ArrayList();
	ArrayList result6=new ArrayList();
	if(!auther.isEmpty()){
		String que="Select name FROM publish "
				+ "Where id IN(SELECT id_publish from auther_publish"
				+ " WHERE id_auther IN(SELECT id from auther "
				+ "WHERE surname='"+auther+"'))";
		res=st.executeQuery(que);
		while(res.next()){
			result.add(res.getString(1));
			if(res.isLast())break;
		}	
		if(result.isEmpty()){JOptionPane.showMessageDialog(null, "Your data is wrong!");
		return null;
	}
		}
	if(!word.isEmpty()){
		String que1="SELECT name from publish "
						+ " WHERE id IN(SELECT id_publish from publish_keyword "
						+ " WHERE id_keyword IN(SELECT id from keyword "
						+ " WHERE word='"+word+"'))";
		res=st.executeQuery(que1);
		while(res.next()){
			result1.add(res.getString(1));
			if(res.isLast())break;
			}
		
		if(result1.isEmpty()) {JOptionPane.showMessageDialog(null, "Your data is wrong!");
		return null;
	}}
	if(!topic.isEmpty()){String que2="SELECT name from publish "
						+ " WHERE id IN(SELECT id_publish from book_publish"
						+ " WHERE id_book IN(SELECT id from book"
						+ " WHERE id_scientific_publish in (SELECT id_scientific_publish from tema_scientific_publish"
						+ " WHERE id_tema in (SELECT id from tema"
						+ " WHERE name='"+topic+"'))))";
				String que21="SELECT name from publish "
						+ " WHERE id IN(SELECT id_publish from zbirnik_publish"
						+ " WHERE id_zbirnik IN(SELECT id from zbirnik"
						+ " WHERE id_scientific_publish in (SELECT id_scientific_publish from tema_scientific_publish"
						+ " WHERE id_tema in (SELECT id from tema"
						+ " WHERE name='"+topic+"'))))";
				res=st.executeQuery(que2);
				
				while(res.next()){
					result2.add(res.getString(1));
						if(res.isLast())break;
				}
					res=st.executeQuery(que21);
					while(res.next()){
						result2.add(res.getString(1));
						if(res.isLast())break;
	}
					if(result2.isEmpty()) {JOptionPane.showMessageDialog(null, "Your data is wrong!");
					return null;
					}
					}
	if(!type.isEmpty()){
		String que3="SELECT name from publish "
						+ " WHERE id IN(SELECT id_publish from book_publish"
						+ " WHERE id_book IN(SELECT id from book"
						+ " WHERE type='"+type+"'))";
		res=st.executeQuery(que3);
		while(res.next()){
			result4.add(res.getString(1));	
			if(res.isLast())break;
		}
		if(result4.isEmpty()){JOptionPane.showMessageDialog(null, "Your data is wrong!");
		return null;
	}
		}
	if(!dateFieldf.isEmpty()&&!dateFieldt.isEmpty()){String que4="SELECT name from publish "
						+ " WHERE id IN(SELECT id_publish from book_publish"
						+ " WHERE id_book IN(SELECT id from book"
						+ " WHERE id_scientific_publish in (SELECT id from scientific_publish"
						+ " WHERE dateOfPublish between '"+dateFieldf +"' and '"+dateFieldt+"')))";
	res=st.executeQuery(que4);
	while(res.next()){
		result5.add(res.getString(1));
		if(res.isLast())break;			 
	}
	String que41="SELECT name from publish "
						+ " WHERE id IN(SELECT id_publish from zbirnik_publish"
						+ " WHERE id_zbirnik IN(SELECT id from zbirnik"
						+ " WHERE id_scientific_publish in (SELECT id from scientific_publish"
						+ " WHERE dateOfPublish between '"+dateFieldf +"' and '"+dateFieldt+"')))";
				 res=st.executeQuery(que41);
					while(res.next()){
						result5.add(res.getString(1));	
						if(res.isLast())break;		 
	}
					if(result5.isEmpty()) {JOptionPane.showMessageDialog(null, "Your data is wrong!");
					return null;
					}
					}
	ArrayList resultAll=new ArrayList();
if(!result.isEmpty()){
	resultAll.add(result);
}
if(!result1.isEmpty()){
	resultAll.add(result1);
}
if(!result2.isEmpty()){
	resultAll.add(result2);
}
if(!result3.isEmpty()){
	resultAll.add(result3);
}
if(!result4.isEmpty()){
	resultAll.add(result4);
}
if(!result5.isEmpty()){
	resultAll.add(result5);
}
if(!result6.isEmpty()){
	resultAll.add(result6);
}
result=new ArrayList();
if(resultAll.isEmpty())return null;
else
return result=takeRes(resultAll);
	}
public ArrayList takeRes(ArrayList<ArrayList> res){
	ArrayList result=new ArrayList();
	if(res.size()>1){
	for(int i=0;i<res.size();i++){
		for(int c=0;c<res.get(i).size();c++){
			boolean  isd=true;
			for(int m=0;m<res.size();m++){
			if(!res.get(m).contains(res.get(i).get(c))){
				isd=false;
				break;
			}
			
			
		}
			if(isd && !result.contains(res.get(i).get(c)))result.add(res.get(i).get(c));
			}
	}
	return result;
	}
	else return res.get(0);
	
}
}
