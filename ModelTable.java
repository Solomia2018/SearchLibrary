import java.util.*;
import javax.swing.table.*;
@SuppressWarnings({ "rawtypes", "unchecked", "serial" })
public class ModelTable extends AbstractTableModel {
     ArrayList columnNames = new ArrayList();
   
	 ArrayList<Class> columnTypes = new ArrayList();
    ModelTable() {
    	columnNames.add(" ");
    	columnNames.add("Ident");
    columnNames.add("Nam");
    columnNames.add("Num");
    columnNames.add("Da"); 
    columnTypes.add(String.class);
    columnTypes.add(String.class);
    columnTypes.add(String.class);
    columnTypes.add(String.class);
    columnTypes.add(String.class);
    }
     private ArrayList data = new ArrayList();
     public int getRowCount() {return data.size();}
     public int getColumnCount(){
    	 return columnNames.size();}
     public void setDataSource(ArrayList dataIn,String[] names,Class[] types){
     data.clear();
     setInitialModelN(names,types);
     if (dataIn != null) {
       for (int i = 0; i < dataIn.size(); i++)
         data.add(dataIn.get(i));
       fireTableDataChanged();
     }
     }
    public Object getValueAt(int row, int column) {
         return ((ArrayList) data.get(row)).get(column);
    }
public String getColumnName
    (int column) {
	System.out.println( columnNames.size());
return (String) columnNames.get(column); 
}
public Class getColumnClass(int column){
return (Class) columnTypes.get(column); 
}
    public void setInitialModelN(String [] columnInfor,Class[] columnInfor1) {
        columnNames.clear();
        columnTypes.clear();
	if(columnInfor!=null){ 
          for(int i = 1; i < columnInfor.length; i++){ 
            columnNames.add(columnInfor[i]);
            columnTypes.add(columnInfor1[i]);
            }
	}
       fireTableStructureChanged(); }
    
}
