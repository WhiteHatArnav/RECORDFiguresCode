datasource = 'live_database'; %ENTER YOUR DATASOURCE NAME HERE, default should be "live_database"
username = 'postgres'; %ENTER YOUR USERNAME HERE, default should be "postgres"
password = '1234'; %ENTER YOUR PASSWORD HERE, default should be "1234"
conn = database(datasource,username,password); %creates the database connection
query = "SELECT intensityofcost1, intensityofcost3, subjectid FROM live_table;";
results= fetch(conn,query);

AnimalList = unique(results.subjectid);
n = length(AnimalList);
LuxList = unique(results.intensityofcost3);

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



    
            query2a = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1' AND health = 'N/A' AND feeder = '1' AND lightlevel = '1' AND gender = 'Male';";
            res2a = fetch(conn,query2a);

            query2b = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1' AND health = 'N/A' AND feeder = '2' AND lightlevel = '1' AND gender = 'Male';";
            res2b = fetch(conn,query2b);
            
            query2c = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1' AND health = 'N/A' AND feeder = '3' AND lightlevel = '1' AND gender = 'Male';";
            res2c = fetch(conn,query2c);

            query2d = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1' AND health = 'N/A' AND feeder = '4' AND lightlevel = '1' AND gender = 'Male';";
            res2d = fetch(conn,query2d);

        AcceptancePercent2a = zeros(1,1);
        AcceptanceVector2a = str2double(res2a.approachavoid);
        AcceptanceVector2a = AcceptanceVector2a(~isnan(AcceptanceVector2a));
        len2a= length(AcceptanceVector2a);
        S2a= sum(AcceptanceVector2a);
        AcceptancePercent2a(1) = (S2a/len2a)*100;

        AcceptancePercent2b = zeros(1,1);
        AcceptanceVector2b = str2double(res2b.approachavoid);
        AcceptanceVector2b = AcceptanceVector2b(~isnan(AcceptanceVector2b));
        len2b= length(AcceptanceVector2b);
        S2b= sum(AcceptanceVector2b);
        AcceptancePercent2b(1) = (S2b/len2b)*100;

        AcceptancePercent2c = zeros(1,1);
        AcceptanceVector2c = str2double(res2c.approachavoid);
        AcceptanceVector2c = AcceptanceVector2c(~isnan(AcceptanceVector2c));
        len2c= length(AcceptanceVector2c);
        S2c= sum(AcceptanceVector2c);
        AcceptancePercent2c(1) = (S2c/len2c)*100;

        AcceptancePercent2d = zeros(1,1);
        AcceptanceVector2d = str2double(res2d.approachavoid);
        AcceptanceVector2d = AcceptanceVector2d(~isnan(AcceptanceVector2d));
        len2d= length(AcceptanceVector2d);
        S2d= sum(AcceptanceVector2d);
        AcceptancePercent2d(1) = (S2d/len2d)*100;
   

        for i = 1:n
            query1a = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1L3' AND subjectid = '" + AnimalList(i)+ "' AND intensityofcost3 = '" + LuxList(14) + "' AND health = 'N/A' AND feeder = '1' AND lightlevel = '1' AND gender = 'Male';";
            res1a = fetch(conn,query1a);

            query1b = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1L3' AND subjectid = '" + AnimalList(i)+ "' AND intensityofcost3 = '" + LuxList(14) + "' AND health = 'N/A' AND feeder = '2' AND lightlevel = '1' AND gender = 'Male';";
            res1b = fetch(conn,query1b);
            
            query1c = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1L3' AND subjectid = '" + AnimalList(i)+ "' AND intensityofcost3 = '" + LuxList(14) + "' AND health = 'N/A' AND feeder = '3' AND lightlevel = '1' AND gender = 'Male';";
            res1c = fetch(conn,query1c);

            query1d = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1L3' AND subjectid = '" + AnimalList(i)+ "' AND intensityofcost3 = '" + LuxList(14) + "' AND health = 'N/A' AND feeder = '4' AND lightlevel = '1'  AND gender = 'Male';";
            res1d = fetch(conn,query1d);
    
        AcceptanceVector1a = str2double(res1a.approachavoid);
        AcceptanceVector1a = AcceptanceVector1a(~isnan(AcceptanceVector1a));
        l1a= length(AcceptanceVector1a);
        S1a= sum(AcceptanceVector1a);
        AcceptancePercent1a(i) = (S1a/l1a)*100;

        AcceptanceVector1b = str2double(res1b.approachavoid);
        AcceptanceVector1b = AcceptanceVector1b(~isnan(AcceptanceVector1b));
        l1b= length(AcceptanceVector1b);
        S1b= sum(AcceptanceVector1b);
        AcceptancePercent1b(i) = (S1b/l1b)*100;

        AcceptanceVector1c = str2double(res1c.approachavoid);
        AcceptanceVector1c = AcceptanceVector1c(~isnan(AcceptanceVector1c));
        l1c= length(AcceptanceVector1c);
        S1c= sum(AcceptanceVector1c);
        AcceptancePercent1c(i) = (S1c/l1c)*100;

        AcceptanceVector1d = str2double(res1d.approachavoid);
        AcceptanceVector1d = AcceptanceVector1d(~isnan(AcceptanceVector1d));
        l1d= length(AcceptanceVector1d);
        S1d= sum(AcceptanceVector1d);
        AcceptancePercent1d(i) = (S1d/l1d)*100;

        MaleEntry1(i) = (AcceptancePercent2d(1) - AcceptancePercent1d(i))*100/AcceptancePercent2d(1);
        MaleEntry2(i) = (AcceptancePercent2c(1) - AcceptancePercent1c(i))*100/AcceptancePercent2c(1);
        MaleEntry3(i) = (AcceptancePercent2b(1) - AcceptancePercent1b(i))*100/AcceptancePercent2b(1);
        MaleEntry4(i) = (AcceptancePercent2a(1) - AcceptancePercent1a(i))*100/AcceptancePercent2a(1);


        end 

Reward(1) = 0.5;
Reward(2) = 2;
Reward(3) = 5;
Reward(4) = 9;


MaleEntry(1) = mean(MaleEntry1, 'omitnan');
MaleEntry(2) = mean(MaleEntry2, 'omitnan');
MaleEntry(3) = mean(MaleEntry3, 'omitnan');
MaleEntry(4) = mean(MaleEntry4, 'omitnan');

err(1) = std(MaleEntry1, 'omitnan')/sqrt(9);
err(2) = std(MaleEntry2, 'omitnan')/sqrt(9);
err(3) = std(MaleEntry3, 'omitnan')/sqrt(9);
err(4) = std(MaleEntry4, 'omitnan')/sqrt(9);
 errorbar(Reward, MaleEntry, err);
 hold on

            query2a = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1' AND health = 'N/A' AND feeder = '1' AND lightlevel = '1' AND gender = 'Female';";
            res2a = fetch(conn,query2a);

            query2b = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1' AND health = 'N/A' AND feeder = '2' AND lightlevel = '1' AND gender = 'Female';";
            res2b = fetch(conn,query2b);
            
            query2c = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1' AND health = 'N/A' AND feeder = '3' AND lightlevel = '1' AND gender = 'Female';";
            res2c = fetch(conn,query2c);

            query2d = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1' AND health = 'N/A' AND feeder = '4' AND lightlevel = '1' AND gender = 'Female';";
            res2d = fetch(conn,query2d);

        AcceptancePercent2a = zeros(1,1);
        AcceptanceVector2a = str2double(res2a.approachavoid);
        AcceptanceVector2a = AcceptanceVector2a(~isnan(AcceptanceVector2a));
        len2a= length(AcceptanceVector2a);
        S2a= sum(AcceptanceVector2a);
        AcceptancePercent2a(1) = (S2a/len2a)*100;

        AcceptancePercent2b = zeros(1,1);
        AcceptanceVector2b = str2double(res2b.approachavoid);
        AcceptanceVector2b = AcceptanceVector2b(~isnan(AcceptanceVector2b));
        len2b= length(AcceptanceVector2b);
        S2b= sum(AcceptanceVector2b);
        AcceptancePercent2b(1) = (S2b/len2b)*100;

        AcceptancePercent2c = zeros(1,1);
        AcceptanceVector2c = str2double(res2c.approachavoid);
        AcceptanceVector2c = AcceptanceVector2c(~isnan(AcceptanceVector2c));
        len2c= length(AcceptanceVector2c);
        S2c= sum(AcceptanceVector2c);
        AcceptancePercent2c(1) = (S2c/len2c)*100;

        AcceptancePercent2d = zeros(1,1);
        AcceptanceVector2d = str2double(res2d.approachavoid);
        AcceptanceVector2d = AcceptanceVector2d(~isnan(AcceptanceVector2d));
        len2d= length(AcceptanceVector2d);
        S2d= sum(AcceptanceVector2d);
        AcceptancePercent2d(1) = (S2d/len2d)*100;
   

        for i = 1:n
            query1a = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1L3' AND subjectid = '" + AnimalList(i)+ "' AND intensityofcost3 = '" + LuxList(14) + "' AND health = 'N/A' AND feeder = '1' AND lightlevel = '1' AND gender = 'Female';";
            res1a = fetch(conn,query1a);

            query1b = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1L3' AND subjectid = '" + AnimalList(i)+ "' AND intensityofcost3 = '" + LuxList(14) + "' AND health = 'N/A' AND feeder = '2' AND lightlevel = '1' AND gender = 'Female';";
            res1b = fetch(conn,query1b);
            
            query1c = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1L3' AND subjectid = '" + AnimalList(i)+ "' AND intensityofcost3 = '" + LuxList(14) + "' AND health = 'N/A' AND feeder = '3' AND lightlevel = '1' AND gender = 'Female';";
            res1c = fetch(conn,query1c);

            query1d = "SELECT approachavoid FROM live_table WHERE tasktypedone = 'P2 L1L3' AND subjectid = '" + AnimalList(i)+ "' AND intensityofcost3 = '" + LuxList(14) + "' AND health = 'N/A' AND feeder = '4' AND lightlevel = '1'  AND gender = 'Female';";
            res1d = fetch(conn,query1d);
    
        AcceptanceVector1a = str2double(res1a.approachavoid);
        AcceptanceVector1a = AcceptanceVector1a(~isnan(AcceptanceVector1a));
        l1a= length(AcceptanceVector1a);
        S1a= sum(AcceptanceVector1a);
        AcceptancePercent1a(i) = (S1a/l1a)*100;

        AcceptanceVector1b = str2double(res1b.approachavoid);
        AcceptanceVector1b = AcceptanceVector1b(~isnan(AcceptanceVector1b));
        l1b= length(AcceptanceVector1b);
        S1b= sum(AcceptanceVector1b);
        AcceptancePercent1b(i) = (S1b/l1b)*100;

        AcceptanceVector1c = str2double(res1c.approachavoid);
        AcceptanceVector1c = AcceptanceVector1c(~isnan(AcceptanceVector1c));
        l1c= length(AcceptanceVector1c);
        S1c= sum(AcceptanceVector1c);
        AcceptancePercent1c(i) = (S1c/l1c)*100;

        AcceptanceVector1d = str2double(res1d.approachavoid);
        AcceptanceVector1d = AcceptanceVector1d(~isnan(AcceptanceVector1d));
        l1d= length(AcceptanceVector1d);
        S1d= sum(AcceptanceVector1d);
        AcceptancePercent1d(i) = (S1d/l1d)*100;

FemaleEntry1(i) = (AcceptancePercent2d(1) - AcceptancePercent1d(i))*100/AcceptancePercent2d(1);
FemaleEntry2(i) = (AcceptancePercent2c(1) - AcceptancePercent1c(i))*100/AcceptancePercent2c(1);
FemaleEntry3(i) = (AcceptancePercent2b(1) - AcceptancePercent1b(i))*100/AcceptancePercent2b(1);
FemaleEntry4(i) = (AcceptancePercent2a(1) - AcceptancePercent1a(i))*100/AcceptancePercent2a(1);


        end 


Reward(1) = 0.5;
Reward(2) = 2;
Reward(3) = 5;
Reward(4) = 9;


FemaleEntry(1) = mean(FemaleEntry1, 'omitnan');
FemaleEntry(2) = mean(FemaleEntry2, 'omitnan');
FemaleEntry(3) = mean(FemaleEntry3, 'omitnan');
FemaleEntry(4) = mean(FemaleEntry4, 'omitnan');

err(1) = std(FemaleEntry1, 'omitnan')/sqrt(12);
err(2) = std(FemaleEntry2, 'omitnan')/sqrt(12);
err(3) = std(FemaleEntry3, 'omitnan')/sqrt(12);
err(4) = std(FemaleEntry4, 'omitnan')/sqrt(12);
          errorbar(Reward, FemaleEntry, err);
         legend('Male', 'Female');
         xlabel("Reward Level");
         ylabel("Percent Change in Acceptance Rate over Cost");
% 
% filename = "MaleFemaleCostEffectPercentChangeinApproachRate.fig";
% saveas(gcf, filename);
 hold off

         