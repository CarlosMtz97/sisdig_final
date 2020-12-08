//
//
//
//
//        This program reads an input color image in *.ppm format
//        and converts it into a Xilinx *.coe file. The *.coe file
//        will be used to initialize a ROM described by the IP tool
//
//
//
//------------------------------------------------------------------------------
//                  Version updated: November 26, 2017
//                               RickWare
//------------------------------------------------------------------------------

//==============================================================================
//------------------------P R O G R A M-----------------------------------------
//==============================================================================

void     heading(void);
void     openfiles(void);
void     convert(void);
void     readhdr(void);
void     addhdr(void);
void     closefiles();
void     display(void);
//------------------------------------------------------------------------------
# include <stdio.h>
# include <math.h>
# include <stdlib.h>
//------------------------------------------------------------------------------
int      MRows, NCols;                     //indices for rows and cols
FILE     *infptr, *outfptr;                //input/output file pointers
char     infile[40];
char     static  outfile[40];              //names of input/output image files
char     hexadecimalnum[2];

//------------------------------------------------------------------------------
//-----------------------------MAIN---------------------------------------------
//------------------------------------------------------------------------------
main()
{
    //--------------( Display Heading with information )------------------------
    heading();
    //---------------(Open Input & Output Image Files)--------------------------
    openfiles();
    //-------------
    readhdr();
    //-------------
    addhdr();
    //---------------------(Convert to grayscale)-------------------------------
    convert();
    //------------------(Close Any Open Image Files)----------------------------
    closefiles();
    //--------------------------------------------------------------------------
    printf("\n Bye! Bye!\n");
    system("PAUSE");
    return (1);
} //end main()

//------------------------------------------------------------------------------
//----------------------------HEADING-------------------------------------------
//------------------------------------------------------------------------------
void heading()
{ int      i;
  for (i=0;i<16;i++) printf("                                     +\n");
  printf("                       Digital Image Processing Program\n");
  printf("                         Updated: February 5, 2009\n");
  printf("                                 RickWare\n");
  for (i=0;i<4;i++)  printf("                                     +\n");
}//end heading()

//------------------------------------------------------------------------------
//--------------------------OPENFILES-------------------------------------------
//------------------------------------------------------------------------------
void openfiles(void)
{
  printf("\n                 OPEN an image file\n");
  printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
  printf(" Enter name of *.ppm INPUT image file: ? ");
  scanf("%s",&infile);
  printf(" Enter name of *.coe OUTPUT image file: ? ");
  scanf("%s",&outfile);

  if ((infptr = fopen(infile, "rb")) == NULL)
  { printf(" Can NOT open input image file: <%s>\n",infile);
    printf(" Exiting program..... "); system("PAUSE"); exit(1);
  }
  else  printf(" Input file <%s> opened sucessfully\n\n",infile);

  if ((outfptr = fopen(outfile,"wb")) == NULL)
  { printf(" Can NOT open output image file <%s>\n\n",outfile);
    printf(" Exiting program....."); system("PAUSE"); exit(1);
  }
  else printf(" Output file <%s> is opened sucessfully\n\n",outfile);

  return;
}//end openfiles()

//------------------------------------------------------------------------------
//------------------------------READHDR-----------------------------------------
//------------------------------------------------------------------------------
void readhdr()
{
  int     i, k=0, MaxRGB;
  char    c, c1, buffer[128];
  //-----------------------[Read PPM File Header]-------------------------------
  printf("\n\n File <%s> Header Bytes:\n",infile);
  printf("------------------------------------------------------------\n");
    i = 0;
    do
    { c = fgetc(infptr);
      buffer[i] = c; i++;
    } while (c != '\n');

     c1 = buffer[1];

     if (c1 == '6')
     {
       printf("\nFile type is:  <P%c>, OK\n",c1);
     }
     else
     { printf(" Image is in WRONG format!! Quitting.........\n\n");
       system("PAUSE");
       exit(0);
     }

     // Check if file has a comment, denoted by a '#' character
     c = fgetc(infptr);
     // Comment line found, skip the comment
     if (c == '#') {
    	i = 0;
    	do
		{
			c = fgetc(infptr);
      		buffer[i] = c; i++;
    	} while (c != '\n');
	 }
	 else
       fseek(infptr,-1,SEEK_CUR);

  // Read the rest of the header
  fscanf(infptr,"%d %d %d",&NCols, &MRows, &MaxRGB);
  c = fgetc(infptr);
  printf("%d ",NCols);
  printf("%d     <-----(Width & Height)\n", MRows);
  printf("%d         <-----(Max. RGB Level)\n\n",MaxRGB);
}//end readhdr()

//------------------------------------------------------------------------------
//-------------------------------ADDHDR-----------------------------------------
//------------------------------------------------------------------------------
void addhdr()
{

  //Add *.coe Header
  fprintf(outfptr,"; Image Size = %d x %d \n",NCols,MRows);
  fprintf(outfptr,"; Original file name: '%s'\n",infile);
  fprintf(outfptr,"; Created by Elmer Homero \n");
  fprintf(outfptr,"; November 29, 2017 \n");
  fprintf(outfptr,"; \n");
  fprintf(outfptr,"memory_initialization_radix = 16;\n");
  fprintf(outfptr,"memory_initialization_vector =\n");
}

//------------------------------------------------------------------------------
//------------------------------int to hex--------------------------------------
//------------------------------------------------------------------------------
void dectohex (unsigned char decimalnum)
{
	long quotient, remainder;
    int i = 1, j = 0;
    // char hexadecimalnum[2];

    quotient = decimalnum;

    // while (quotient != 0)
    while (i >= 0)
    {
        remainder = quotient % 16;
        if (remainder < 10)
            hexadecimalnum[j++] = 48 + remainder;
        else
            hexadecimalnum[j++] = 55 + remainder;
        quotient = quotient / 16;
        i --;
    }

}

//------------------------------------------------------------------------------
//--------------------------------conversion------------------------------------
//------------------------------------------------------------------------------
void convert()
{
  unsigned char R,G,B,RGB;
  unsigned cont = 0;
  unsigned long imagesize,contpixel = 1;

  //Obtain size of image
  imagesize = NCols * MRows;

  //Perform conversions
  R = fgetc(infptr);
  do{
     G = fgetc(infptr);
     B = fgetc(infptr);
     //printf("Before: R = %d, G = %d, B = %d \n",R,G,B);

	 R = (R >> 5) << 5;
     G = (G >> 5) << 2;
     B = (B >> 6);
     RGB = R + G + B;

     //printf("After: R = %d, G = %d, B = %d \n",R,G,B);
     //printf("Decimal RGB = %d \n",RGB);


     dectohex(RGB);
         int j = 0;
     //printf("Hexadecimal RGB = ");
     for (int i = 1; i >= 0; i--){
        if(j == 0){
            fprintf(outfptr,"x\"%c",hexadecimalnum[i]);
            j = 1;
        }else{
            fprintf(outfptr,"%c\"",hexadecimalnum[i]);
            j = 0;
        }
     }
     //printf("\n");

     //system("PAUSE");

	 //fprintf(outfptr,"%d",RGB);
     if (contpixel < imagesize)
     	fputc(',',outfptr);
     cont++; contpixel++;
     if (cont == 16)
     {
     	cont = 0;
     	fputc('\n',outfptr);
	 }
     //fputc('\n',outfptr);
     //Read next pixel to check if we have an End of File
     R = fgetc(infptr);
  } while (!feof(infptr));
}

//------------------------------------------------------------------------------
//----------------------------CLOSEFILES----------------------------------------
//------------------------------------------------------------------------------
void closefiles()
{ //------------------------(Close Files)---------------------------------------
  fclose(infptr);
  fclose(outfptr);
  return;
} //end closefiles()
//------------------------------------------------------------------------------
