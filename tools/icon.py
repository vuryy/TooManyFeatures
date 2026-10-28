from PIL import Image, ImageDraw
N=32
img=Image.new("RGBA",(N,N),(0,0,0,0))
d=ImageDraw.Draw(img)
d.rounded_rectangle([0,0,N-1,N-1],radius=4,fill=(10,30,26,255))
px=img.load()
top,bot=(24,96,90),(16,50,42)
for y in range(1,N-1):
    for x in range(1,N-1):
        # inner rounded area: keep border 1px
        if px[x,y][3]==0: continue
        nb=[px[x+dx,y+dy][3] for dx,dy in((1,0),(-1,0),(0,1),(0,-1))]
        if 0 in nb: continue
        t=y/(N-1); c=tuple(int(top[i]+(bot[i]-top[i])*t) for i in range(3))
        if (x+y)%6==0: c=tuple(min(255,v+7) for v in c)
        px[x,y]=c+(255,)
for x in range(4,28): px[x,1]=(80,160,145,255)
T=["######","######","..##..","..##..","..##..","..##..","..##..","..##..","..##.."]
M=["##...##","###.###","#######","##.#.##","##...##","##...##","##...##","##...##","##...##"]
F=["######","######","##....","##....","#####.","##....","##....","##....","##...."]
gold,shade,dark=(255,208,72),(232,160,40),(60,34,0)
mask={}
def add(bm,ox,oy):
    for j,row in enumerate(bm):
        for i,ch in enumerate(row):
            if ch=="#": mask[(ox+i,oy+j)]=j/(len(bm)-1)
ox,oy=4,6
add(T,ox,oy); add(M,ox+8,oy); add(F,ox+17,oy)
for (x,y) in mask:
    for dx,dy in ((1,1),(0,1),(1,0)):
        p=(x+dx,y+dy)
        if p not in mask: px[p]=dark+(255,)
for (x,y),t in mask.items():
    px[x,y]=(gold if t<0.5 else shade)+(255,)
def toggle(x,y,on):
    body=(64,196,96) if on else (96,108,108)
    edge=(30,110,55) if on else (55,62,62)
    for i in range(8):
        for j in range(4):
            if i in(0,7) and j in(0,3): continue
            px[x+i,y+j]=body+(255,)
    for i in range(1,7): px[x+i,y+4]=edge+(255,)
    px[x,y+3]=edge+(255,); px[x+7,y+3]=edge+(255,)
    kx=x+5 if on else x+1
    for i in range(2):
        for j in range(2): px[kx+i,y+1+j]=(248,248,240,255)
toggle(3,22,True); toggle(12,22,True); toggle(21,22,False)
for (x,y) in ((27,3),(27,2),(27,4),(26,3),(28,3)): px[x,y]=(255,246,200,255)
px[27,3]=(255,255,255,255)
px[4,18]=(255,236,160,255)
img.resize((512,512),Image.NEAREST).save("pack.png")
