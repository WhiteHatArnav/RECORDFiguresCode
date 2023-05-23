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



 
            query2a = "SELECT approachavoid FROM live_table WHERE date >= '08/22/2022' AND date <= '08/25/2022' AND tasktypedone = 'P2 L1' AND health = 'Food Deprivation' AND feeder = '1' AND lightlevel = '1';";
            res2a = fetch(conn,query2a);

            query2b = "SELECT approachavoid FROM live_table WHERE  date >= '08/22/2022' AND date <= '08/25/2022' AND tasktypedone = 'P2 L1' AND health = 'Food Deprivation' AND feeder = '2' AND lightlevel = '1';";
            res2b = fetch(conn,query2b);
            
            query2c = "SELECT approachavoid FROM live_table WHERE  date >= '08/22/2022' AND date <= '08/25/2022' AND tasktypedone = 'P2 L1' AND health = 'Food Deprivation' AND feeder = '3' AND lightlevel = '1';";
            res2c = fetch(conn,query2c);

            query2d = "SELECT approachavoid FROM live_table WHERE  date >= '08/22/2022' AND date <= '08/25/2022' AND tasktypedone = 'P2 L1' AND health = 'Food Deprivation' AND feeder = '4' AND lightlevel = '1';";
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
   

        for k = 1:l2
            query1a = "SELECT approachavoid FROM live_table WHERE  date >= '08/22/2022' AND date <= '08/25/2022' AND tasktypedone = 'P2 L1L3' AND intensityofcost3 = '" + LuxList(k) + "' AND health = 'Food Deprivation' AND feeder = '1' AND lightlevel = '1';";
            res1a = fetch(conn,query1a);

            query1b = "SELECT approachavoid FROM live_table WHERE  date >= '08/22/2022' AND date <= '08/25/2022' AND  tasktypedone = 'P2 L1L3' AND intensityofcost3 = '" + LuxList(k) + "' AND health = 'Food Deprivation' AND feeder = '2' AND lightlevel = '1';";
            res1b = fetch(conn,query1b);
            
            query1c = "SELECT approachavoid FROM live_table WHERE  date >= '08/22/2022' AND date <= '08/25/2022' AND tasktypedone = 'P2 L1L3' AND intensityofcost3 = '" + LuxList(k) + "' AND health = 'Food Deprivation' AND feeder = '3' AND lightlevel = '1';";
            res1c = fetch(conn,query1c);

            query1d = "SELECT approachavoid FROM live_table WHERE  date >= '08/22/2022' AND date <= '08/25/2022' AND tasktypedone = 'P2 L1L3' AND intensityofcost3 = '" + LuxList(k) + "' AND health = 'Food Deprivation' AND feeder = '4' AND lightlevel = '1';";
            res1d = fetch(conn,query1d);
    
        AcceptanceVector1a = str2double(res1a.approachavoid);
        AcceptanceVector1a = AcceptanceVector1a(~isnan(AcceptanceVector1a));
        l1a= length(AcceptanceVector1a);
        S1a= sum(AcceptanceVector1a);
        AcceptancePercent1a(k) = (S1a/l1a)*100;

        AcceptanceVector1b = str2double(res1b.approachavoid);
        AcceptanceVector1b = AcceptanceVector1b(~isnan(AcceptanceVector1b));
        l1b= length(AcceptanceVector1b);
        S1b= sum(AcceptanceVector1b);
        AcceptancePercent1b(k) = (S1b/l1b)*100;

        AcceptanceVector1c = str2double(res1c.approachavoid);
        AcceptanceVector1c = AcceptanceVector1c(~isnan(AcceptanceVector1c));
        l1c= length(AcceptanceVector1c);
        S1c= sum(AcceptanceVector1c);
        AcceptancePercent1c(k) = (S1c/l1c)*100;

        AcceptanceVector1d = str2double(res1d.approachavoid);
        AcceptanceVector1d = AcceptanceVector1d(~isnan(AcceptanceVector1d));
        l1d= length(AcceptanceVector1d);
        S1d= sum(AcceptanceVector1d);
        AcceptancePercent1d(k) = (S1d/l1d)*100;

        end 


        joinedAccPerd = cat(2,AcceptancePercent2d, AcceptancePercent1d);
        bin1d = joinedAccPerd(2:5);
        bin1entryd = mean(bin1d, 'omitnan');
        bin2d =  joinedAccPerd(6:11);
        bin2entryd = mean(bin2d, 'omitnan');
        bin3d = joinedAccPerd(12:15);
        bin3entryd = mean(bin3d, 'omitnan');
        
       
        joinedAccPerc = cat(2,AcceptancePercent2c, AcceptancePercent1c);
        bin1c = joinedAccPerc(2:5);
        bin1entryc = mean(bin1c, 'omitnan');
        bin2c =  joinedAccPerc(6:11);
        bin2entryc = mean(bin2c, 'omitnan');
        bin3c = joinedAccPerc(12:15);
        bin3entryc = mean(bin3c, 'omitnan');
        
        joinedAccPerb = cat(2,AcceptancePercent2b, AcceptancePercent1b);
        bin1b = joinedAccPerb(2:5);
        bin1entryb = mean(bin1b, 'omitnan');
        bin2b =  joinedAccPerb(6:11);
        bin2entryb = mean(bin2b, 'omitnan');
        bin3b = joinedAccPerb(12:15);
        bin3entryb = mean(bin3b, 'omitnan');

        joinedAccPera = cat(2,AcceptancePercent2a, AcceptancePercent1a);
        bin1a = joinedAccPera(2:5);
        bin1entrya = mean(bin1a, 'omitnan');
        bin2a =  joinedAccPera(6:11);
        bin2entrya = mean(bin2a, 'omitnan');
        bin3a = joinedAccPera(12:15);
        bin3entrya = mean(bin3a, 'omitnan');

Z = zeros(4,2);

Z(1,1) = AcceptancePercent2d(1);
Z(2,1) = AcceptancePercent2c(1);
Z(3,1) = AcceptancePercent2b(1);
Z(4,1) = AcceptancePercent2a(1);


Z(1,2) = bin3entryd;
Z(2,2) = bin3entryc;
Z(3,2) = bin3entryb;
Z(4,2) = bin3entrya;

disp(Z)
Out = transpose(Z);

        Cost = [15.0, 297.5];
        Reward = [0.5, 2, 5, 9];

lCost = log10(Cost);
lReward = log(Reward);

 contourf(lReward, Cost,Out, 50);
 c = turbo(100);
 colormap(c);
 a = colorbar;
 ylabel(a,'Approach Rate(%)')
title("Food Deprivation Color Map")
xlabel('Reward, ln(Sugar Water Concentraion)');
ylabel('Cost, Lux');
% filename = "Food Deprivation ColorMap.fig";
% saveas(gcf, filename);