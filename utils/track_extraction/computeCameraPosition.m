function cameraPosition = computeCameraPosition(calibration, c) %#ok

%% COMPUTE POSE DATA
% get image/world points to compute calibration
% [~, imagePoints, worldPoints] = image_to_world([], c); worldPoints = [worldPoints, zeros(4,1)];

% 1) use opencv
% [rvec, tvec] = cv.solvePnP(worldPoints, imagePoints, calibration(c).cameraMatrix, []); rvec = cv.Rodrigues(rvec);

% 2) use efficient_pnp
% [rvec,tvec] = efficient_pnp_gauss(worldPoints, imagePoints,calibration(c).cameraMatrix);

% 3) use rpnp with normalized image plane points
% imagePoints  = imagePoints' - repmat([calibration(c).cameraMatrix(1, 3); calibration(c).cameraMatrix(2, 3)], 1, size(imagePoints, 1));
% imagePoints  = imagePoints ./ repmat([calibration(c).cameraMatrix(1,1); calibration(c).cameraMatrix(2,2)], 1, size(imagePoints, 2));
% [rvec,tvec]= RPnP(worldPoints', imagePoints);

%% USE PRECOMPUTED DATA
if c == 1
    rvec = [-0.492642178017801 0.870022905404954 -0.0190742892030141;-0.205003721811655 -0.0947238758160186 0.974166752354935;0.845740597631003 0.483825930910193 0.225022910161696];
    tvec = [-55.3213480575146;8.86627396197702;7.08480108522491];
end
if c == 2
    rvec = [0.0579414992425846 0.997394058017463 0.0429869247211089;-0.200579993274932 -0.0305505412079555 0.979200863321581;0.97796239649761 -0.0653586831519556 0.198287149289339];
    tvec = [-30.0173026699373;3.77174565384788;31.4467932472112];
end
if c == 3
    rvec = [-0.475597130101132 0.877354079708568 -0.063696064700255;0.233858354529021 0.195909439902755 0.952328599472875;0.84800804233011 0.438028891941754 -0.298350548797439];
    tvec = [7.92512121010297;2.14897198833641;-3.35979832348378];
end
if c == 4
    rvec = [0.999600997054984 -0.0171760417660645 0.0224238773616974;-0.0162540781221277 0.299484156755174 0.953962811013638;-0.023100901088092 -0.953946656497046 0.299085480969949];
    tvec = [-32.5777798444836;10.1383488912369;-9.55458173946362];
end
if c == 5
    rvec = [0.132897206612524 0.988585889956149 0.0709666869326499;-0.400280495614111 -0.0119682523592977 0.916314512471775;0.906704945009958 -0.150182219703508 0.394121102682179];
    tvec = [-1.72959400039486;-3.6170293785304;33.2602545878358];
end
if c == 6
    rvec = [-0.977174511463589 -0.212337602316411 0.00653580816826065;0.0177685230916146 -0.0510351904657521 0.998538776874122;-0.211693773486698 0.97586277312778 0.0536432129007998];
    tvec = [-27.0088786684033;0.911329783199987;50.1029617099075];
end
if c == 7
    rvec = [-0.507656448847988 -0.861548449812279 0.00438161717967611;-0.082129415431663 0.0534549812033756 0.995187079953011;-0.857636105270704 0.504853279290732 -0.0978952364800796];
    tvec = [-7.31764630167351;2.94284556413607;-0.235794365333];
end
if c == 9
    rvec = [0.484654246894443 0.87465893444478 -0.00905590211419748;-0.0309891522385742 0.0275160356692566 0.99914090108682;0.874156698430387 -0.483957246228394 0.0404407024211427];
    tvec = [-21.816021093677;4.59030512868051;60.8664623403227];
end

% output camera position info
cameraPosition.rvec = rvec;
cameraPosition.tvec = tvec;
cameraPosition.pos  = rvec' * tvec;

end