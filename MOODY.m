%%%%%%%
%%%
%%%   MOODY DIAGRAM
%%%   Ganeshchandra Mallya, 2018
%%%
%%%%%%

%Solve friction factor using colebrook equation and plot the Moody diagram

clear all
close all

Re=logspace(3.6021,8,100);
K=logspace(-5,-1,10); %(e/D)

figure
for i=1:length(K)
    for j = 1:length(Re)
        F(j,i)=colebrook_gmallya(Re(j),K(i));
    end
    [hAx,hLine1,hLine2] = plotyy(Re,F(:,i),10^8,10^-5,@semilogx,@loglog);
%     semilogx(Re,F,'linewidth',2)
    hold on
end

% Laminar flow
Re = []; F = [];
Re = [500; 2300];
F = 64./Re;
[hAx,hLine1,hLine2] = plotyy(Re,F,10^8,10^-5,@semilogx,@loglog);
set(gca,'xlim',[10^(3.5) 1e8],'ylim',[5e-3 5e-2],'linewidth',2,'box','off','fontweight','b','fontsize',18,'fontname','timesnewroman')
set(gcf,'color','w')
leg=legend(cellstr(num2str(K')));
title(leg,'$${\bf \frac{k_s}{D} }$$','interpreter','latex')
xlabel('Reynolds Number')
ylabel('Friction Factor')
% Compare with Swamee:
% set(gca,'ColorOrderIndex',1)
for i=1:length(K)
    f=0.25./(log10(K(i)./3.7+5.74./Re.^0.9).^2);
    semilogx(Re,f,'--','linewidth',2)
end
