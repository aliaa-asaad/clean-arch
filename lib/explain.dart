/* 
equatable:
PostModel post1= PostModel(title:'test',body:'this is body');
PostModel post2= PostModel(title:'test',body:'this is body');
print(post1==post2);//false
لو انا مثلا عندي كلاس و عملت منه اتنين اوبجكت واديت للاتربيوتس اللي فيه 
نفس الداتا وجيت اتشيك ان الاوبجكتات دي بتساوي بعض هيعملي ايرور فعشان اظبط الموضوع دا بعمل اوفررايد لفانشكن
اسمها هاش كود دي بتتشيك ان كل حاجة جوا الاوبجكتس بتساوي بعض بس لو في اتبريوتس كتير هيكون رخم اني 
اتشيك عليهم كلهم فالباكدج دي هي اللي بتحل الموضوع وممكن استخدمها فالبلوك مثلا بحيث لو انا رجعلي نفس
الستيت فالبلوك فبدل ما ابني اليو اي تاني انا هتشيك عالداتا اللي راجعة لو هي نفس القديمة خلاص مش هبلد اليو اي تاني

get_it:
use it in dependency injection

dartz:
بتخليني استخدم ميثود ترجعلي قيمتين مش قيمة واحدة مثلا قيمة لو الداتا جت فالرايت فاليو وقيمة لو حصل فشل فالليفت فاليو
 */

/* flow:
pages <-> bloc <-> usecase <-> domainRepo(using entities class) <-> data_source
  1- pages: 
  2- bloc: 
  3- usecase: 
  4- repo: 
  5- data_source: 
  6- models: 
  7- entities: 
  8- error_handler: 
  9- core: 
  10- main.dart: 
  11- app.dart: 
  12- routes.dart: 
  13- theme.dart: 
  14- localization.dart: 
  15- constants.dart: 
  16- utils.dart: 
  17- widgets: 
  18- services: 
  19- di: 
  20- config: 
  21- assets: 
  22- lang: 
  23- test: 
  24- android: 
  25- ios: 
  26- web: 
  27- windows: 
  28- macos: 
  29- linux: 
  30- build: 
  31- ci: 
  32- doc: 
  33- lib: 
  34- pubspec.yaml: 
  35- analysis_options.yaml: 
  36- .gitignore: 
  37- .gitlab-ci.yml: 
  38- .env: 
  39- .env.example: 
  40- .travis.yml: 
  41- .github: 
  42- .vscode: 
  43- .idea: 
  44- .metadata: 
  45- .packages: 
  46- .flutter-plugins: 
  47- .flutter-plugins-dependencies: 
  48- .flutter_tool_state: 
  49- .dart_tool: 
  50- .dartignore: 
  51- .analysis_options: 
  52- .git: 
  53- .gitattributes: 
  54- .gitmodules: 
  55- .gitignore: 
  56- .gitkeep: 
  57- .gitlab-ci.yml: 
  58- .gitlab: 
  59- .gitignore: 
  60- .github: 
  61-
 */