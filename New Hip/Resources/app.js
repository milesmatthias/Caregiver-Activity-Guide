// this sets the background color of the master UIView (when there are no windows/tab groups on it)
Titanium.UI.setBackgroundColor('#000');

var m = {}; // My app namespace

/*m.dataDir = Ti.Filesystem.getFile(Ti.Filesystem.applicationDataDirectory, 'data');
if(!m.dataDir.exists()){
	m.dataDir.createDirectory();	
}*/
m.db = Ti.Database.install('/newhip2.sqlite', 'newhip2');
m.dbRT = m.db.execute('SELECT name FROM sqlite_master');
while(m.dbRT.isValidRow()){
	alert(m.dbRT.fieldByName('name'));
	m.dbRT.next();
}

// create tab group
m.tabGroup = Titanium.UI.createTabGroup();

//
// create base UI tab and root window
//
m.win1 = Titanium.UI.createWindow({  
    title:'Benefits',
    backgroundColor:'#fff'
});
m.tab1 = Titanium.UI.createTab({  
    icon:'KS_nav_views.png',
    title:'Benefits',
    window:m.win1
});

m.getRowsBenefits = function(){
	var ret = [];
	
	m.db = Ti.Database.open('newhip2');
	m.dbResults = m.db.execute('SELECT title, desc FROM benefits ORDER BY title');
	while(m.dbResults.isValidRow()){
		var tblRow = Ti.UI.createTableViewRow({
			minRowHeight:32
		});
		var lblTitle = Ti.UI.createLabel({
			text: m.dbResults.fieldByName('ztitle'),
			font: {fontWeight:'bold',fontSize:20},
			left: 40,
			top: 2
		});
		tblRow.add(lblTitle);
		ret.push(tblRow);
		m.dbResults.next();
	}
	m.dbResults.close();
	return ret;
};

m.tblBenefits = Ti.UI.createTableView({
	//data: m.getRowsBenefits()
});

m.win1.add(m.tblBenefits);

//
// create controls tab and root window
//
m.win2 = Titanium.UI.createWindow({  
    title:'Definitions',
    backgroundColor:'#fff'
});
m.tab2 = Titanium.UI.createTab({  
    icon:'KS_nav_ui.png',
    title:'Definitions',
    window:m.win2
});

m.label2 = Titanium.UI.createLabel({
	color:'#999',
	text:'I am Window 2',
	font:{fontSize:20,fontFamily:'Helvetica Neue'},
	textAlign:'center',
	width:'auto'
});

m.win2.add(m.label2);



//
//  add tabs
//
m.tabGroup.addTab(m.tab1);  
m.tabGroup.addTab(m.tab2);  


// open tab group
m.tabGroup.open();
