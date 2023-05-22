datasource = 'live_database'; %ENTER YOUR DATASOURCE NAME HERE, default should be "live_database"
username = 'postgres'; %ENTER YOUR USERNAME HERE, default should be "postgres"
password = '1234'; %ENTER YOUR PASSWORD HERE, default should be "1234"
conn = database(datasource,username,password); %creates the database connection
query = "SELECT intensityofcost1, intensityofcost3, subjectid FROM live_table;";
results= fetch(conn,query);

AnimalList = unique(results.subjectid);
LuxList = unique(results.intensityofcost3);

n = length(AnimalList);
l = length(LuxList);


LuxList1Num = zeros(1,1); 
LuxList1Num(1) = 15;


LuxList = LuxList(2:(l-6));
l2 = length(LuxList);
LuxListNum = zeros(l2,1);
for b = 1:l2
    str = LuxList(b);
    str2 = extractBetween(str, 1,3);
    num = str2num(string(str2));
    LuxListNum(b) = num;
end

joinedLuxList = cat(1,LuxList1Num, LuxListNum);

disp(joinedLuxList);



for i = 1:n
    
            query2 = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1' AND health = 'N/A' AND feeder = '3' AND lightlevel = '1' AND subjectid = '" + AnimalList(i) +"';";
            res2 = fetch(conn,query2);

        AcceptancePercent2 = zeros(1,1);
        AcceptanceVector2 = str2double(res2.approachavoid);
        AcceptanceVector2 = AcceptanceVector2(~isnan(AcceptanceVector2));
        len2= length(AcceptanceVector2);
        S2= sum(AcceptanceVector2);
        AcceptancePercent2(1) = (S2/len2)*100;
   

        for k = 1:l2
            query1 = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1L3' AND intensityofcost3 = '" + LuxList(k) + "' AND health = 'N/A' AND feeder = '3' AND lightlevel = '1'  AND subjectid = '" + AnimalList(i) +"';";
            res1 = fetch(conn,query1);
    
        AcceptanceVector = str2double(res1.approachavoid);
        AcceptanceVector = AcceptanceVector(~isnan(AcceptanceVector));
        l1= length(AcceptanceVector);
        S1= sum(AcceptanceVector);
        AcceptancePercent(k) = (S1/l1)*100;

        end 

       disp(AcceptancePercent2);
        joinedAccPer = cat(2,AcceptancePercent2, AcceptancePercent);
        bin1 = joinedAccPer(2:5);
        bin1entry = mean(bin1, 'omitnan');
        bin1lux = 191.5;
        bin2 =  joinedAccPer(6:11);
        bin2lux = 246.67;
        bin2entry = mean(bin2, 'omitnan');
        bin3 = joinedAccPer(12:15);
        bin3entry = mean(bin3, 'omitnan');
        bin3lux = 297.5;
       

        Luxes(1) = bin1lux;
        Luxes(2) = bin2lux;
        Luxes(3) = bin3lux;
        
        Luxes1(i) = bin1lux;
        Luxes2(i) = bin2lux;
        Luxes3(i) = bin3lux;
        
        Entry1(i) = (AcceptancePercent2(1) - bin1entry)*100/AcceptancePercent2(1);
        Entry2(i) = (AcceptancePercent2(1) - bin2entry)*100/AcceptancePercent2(1);
        Entry3(i) = (AcceptancePercent2(1) - bin3entry)*100/AcceptancePercent2(1);
      
 

end
        scatter(Luxes1, Entry1);
        hold on
        scatter(Luxes2,Entry2);
        hold on
        scatter(Luxes3,Entry3);
        hold on


        Luxes(1) = 191.5;
        Luxes(2) = 246.67;
        Luxes(3) = 297.5;

        Entry(1) = mean(Entry1, 'omitnan');
        Entry(2) = mean(Entry2, 'omitnan');
        Entry(3) = mean(Entry3, 'omitnan');

        lnt = length(Entry1);

        err(1) = std(Entry1, 'omitnan')/sqrt(lnt);
        err(2) = std(Entry2, 'omitnan')/sqrt(lnt);
        err(3) = std(Entry3, 'omitnan')/sqrt(lnt);

        errorbar(Luxes, Entry,err);

AList = AnimalList(~isnan(Entry1));
Entry1 = Entry1(~isnan(Entry1));
Entry2 = Entry2(~isnan(Entry2));
Entry3 = Entry3(~isnan(Entry3));

tab = table(AList, transpose(Entry1), transpose(Entry2), transpose(Entry3));


        xlabel("Cost Level");
        ylabel("Percent Change in Acceptance Rate over Cost");

% filename = "MeanVariedCostEffectPercentChangeinApproachRate.fig";
% saveas(gcf, filename);
hold off